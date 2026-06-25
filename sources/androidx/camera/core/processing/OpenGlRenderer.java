package androidx.camera.core.processing;

import android.graphics.Bitmap;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.util.Log;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.Logger;
import androidx.core.util.Preconditions;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class OpenGlRenderer {
    private static final int PIXEL_STRIDE = 4;
    private static final int SIZEOF_FLOAT = 4;
    private static final String TAG = "OpenGlRenderer";
    private Surface mCurrentSurface;
    private EGLConfig mEglConfig;
    private Thread mGlThread;
    private static final String VAR_TEXTURE_COORD = "vTextureCoord";
    private static final String DEFAULT_VERTEX_SHADER = String.format(Locale.US, "uniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 %s;\nvoid main() {\n    gl_Position = aPosition;\n    %s = (uTexMatrix * aTextureCoord).xy;\n}\n", VAR_TEXTURE_COORD, VAR_TEXTURE_COORD);
    private static final String HDR_VERTEX_SHADER = String.format(Locale.US, "#version 300 es\nin vec4 aPosition;\nin vec4 aTextureCoord;\nuniform mat4 uTexMatrix;\nout vec2 %s;\nvoid main() {\n  gl_Position = aPosition;\n  %s = (uTexMatrix * aTextureCoord).xy;\n}\n", VAR_TEXTURE_COORD, VAR_TEXTURE_COORD);
    private static final String VAR_TEXTURE = "sTexture";
    private static final String DEFAULT_FRAGMENT_SHADER = String.format(Locale.US, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 %s;\nuniform samplerExternalOES %s;\nvoid main() {\n    gl_FragColor = texture2D(%s, %s);\n}\n", VAR_TEXTURE_COORD, VAR_TEXTURE, VAR_TEXTURE, VAR_TEXTURE_COORD);
    private static final String HDR_FRAGMENT_SHADER = String.format(Locale.US, "#version 300 es\n#extension GL_OES_EGL_image_external : require\n#extension GL_EXT_YUV_target : require\nprecision mediump float;\nuniform __samplerExternal2DY2YEXT %s;\nin vec2 %s;\nout vec4 outColor;\n\nvec3 yuvToRgb(vec3 yuv) {\n  const vec3 yuvOffset = vec3(0.0625, 0.5, 0.5);\n  const mat3 yuvToRgbColorTransform = mat3(\n    1.1689f, 1.1689f, 1.1689f,\n    0.0000f, -0.1881f, 2.1502f,\n    1.6853f, -0.6530f, 0.0000f\n  );\n  return clamp(yuvToRgbColorTransform * (yuv - yuvOffset), 0.0, 1.0);\n}\n\nvoid main() {\n  vec3 srcYuv = texture(%s, %s).xyz;\n  outColor = vec4(yuvToRgb(srcYuv), 1.0);\n}", VAR_TEXTURE, VAR_TEXTURE_COORD, VAR_TEXTURE, VAR_TEXTURE_COORD);
    private static final float[] VERTEX_COORDS = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    private static final FloatBuffer VERTEX_BUF = createFloatBuffer(VERTEX_COORDS);
    private static final float[] TEX_COORDS = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f};
    private static final FloatBuffer TEX_BUF = createFloatBuffer(TEX_COORDS);
    private static final OutputSurface NO_OUTPUT_SURFACE = OutputSurface.of(EGL14.EGL_NO_SURFACE, 0, 0);
    private final AtomicBoolean mInitialized = new AtomicBoolean(false);
    final Map<Surface, OutputSurface> mOutputSurfaceMap = new HashMap();
    private EGLDisplay mEglDisplay = EGL14.EGL_NO_DISPLAY;
    private EGLContext mEglContext = EGL14.EGL_NO_CONTEXT;
    private EGLSurface mTempSurface = EGL14.EGL_NO_SURFACE;
    private int mExternalTextureId = -1;
    private int mProgramHandle = -1;
    private int mTexMatrixLoc = -1;
    private int mPositionLoc = -1;
    private int mTexCoordLoc = -1;

    public void init(DynamicRange dynamicRange, ShaderProvider shaderProvider) {
        checkInitializedOrThrow(false);
        try {
            if (dynamicRange.is10BitHdr()) {
                String glExtensions = getGlExtensionsBeforeInitialized(dynamicRange);
                if (!glExtensions.contains("GL_EXT_YUV_target")) {
                    Log.w(TAG, "Device does not support GL_EXT_YUV_target. Fallback to SDR.");
                    dynamicRange = DynamicRange.SDR;
                }
            }
            createEglContext(dynamicRange);
            createTempSurface();
            makeCurrent(this.mTempSurface);
            createProgram(dynamicRange, shaderProvider);
            loadLocations();
            createTexture();
            useAndConfigureProgram();
            this.mGlThread = Thread.currentThread();
            this.mInitialized.set(true);
        } catch (IllegalArgumentException | IllegalStateException e) {
            releaseInternal();
            throw e;
        }
    }

    public void release() {
        if (!this.mInitialized.getAndSet(false)) {
            return;
        }
        checkGlThreadOrThrow();
        releaseInternal();
    }

    public void registerOutputSurface(Surface surface) {
        checkInitializedOrThrow(true);
        checkGlThreadOrThrow();
        if (!this.mOutputSurfaceMap.containsKey(surface)) {
            this.mOutputSurfaceMap.put(surface, NO_OUTPUT_SURFACE);
        }
    }

    public void unregisterOutputSurface(Surface surface) {
        checkInitializedOrThrow(true);
        checkGlThreadOrThrow();
        removeOutputSurfaceInternal(surface, true);
    }

    public int getTextureName() {
        checkInitializedOrThrow(true);
        checkGlThreadOrThrow();
        return this.mExternalTextureId;
    }

    public void render(long timestampNs, float[] textureTransform, Surface surface) {
        checkInitializedOrThrow(true);
        checkGlThreadOrThrow();
        OutputSurface outputSurface = getOutSurfaceOrThrow(surface);
        if (outputSurface == NO_OUTPUT_SURFACE) {
            outputSurface = createOutputSurfaceInternal(surface);
            if (outputSurface == null) {
                return;
            }
            this.mOutputSurfaceMap.put(surface, outputSurface);
        }
        if (surface != this.mCurrentSurface) {
            makeCurrent(outputSurface.getEglSurface());
            this.mCurrentSurface = surface;
            GLES20.glViewport(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
            GLES20.glScissor(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
        }
        GLES20.glUniformMatrix4fv(this.mTexMatrixLoc, 1, false, textureTransform, 0);
        checkGlErrorOrThrow("glUniformMatrix4fv");
        GLES20.glDrawArrays(5, 0, 4);
        checkGlErrorOrThrow("glDrawArrays");
        EGLExt.eglPresentationTimeANDROID(this.mEglDisplay, outputSurface.getEglSurface(), timestampNs);
        if (!EGL14.eglSwapBuffers(this.mEglDisplay, outputSurface.getEglSurface())) {
            Logger.w(TAG, "Failed to swap buffers with EGL error: 0x" + Integer.toHexString(EGL14.eglGetError()));
            removeOutputSurfaceInternal(surface, false);
        }
    }

    public Bitmap snapshot(Size size, float[] textureTransform) {
        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(size.getWidth() * size.getHeight() * 4);
        snapshot(byteBuffer, size, textureTransform);
        Bitmap bitmap = Bitmap.createBitmap(size.getWidth(), size.getHeight(), Bitmap.Config.ARGB_8888);
        byteBuffer.rewind();
        ImageProcessingUtil.copyByteBufferToBitmap(bitmap, byteBuffer, size.getWidth() * 4);
        return bitmap;
    }

    private void snapshot(ByteBuffer byteBuffer, Size size, float[] textureTransform) {
        Preconditions.checkArgument(byteBuffer.capacity() == (size.getWidth() * size.getHeight()) * 4, "ByteBuffer capacity is not equal to width * height * 4.");
        Preconditions.checkArgument(byteBuffer.isDirect(), "ByteBuffer is not direct.");
        int texture = generateTexture();
        GLES20.glActiveTexture(33985);
        checkGlErrorOrThrow("glActiveTexture");
        GLES20.glBindTexture(3553, texture);
        checkGlErrorOrThrow("glBindTexture");
        GLES20.glTexImage2D(3553, 0, 6407, size.getWidth(), size.getHeight(), 0, 6407, 5121, null);
        checkGlErrorOrThrow("glTexImage2D");
        GLES20.glTexParameteri(3553, 10240, 9729);
        GLES20.glTexParameteri(3553, 10241, 9729);
        int fbo = generateFbo();
        GLES20.glBindFramebuffer(36160, fbo);
        checkGlErrorOrThrow("glBindFramebuffer");
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, texture, 0);
        checkGlErrorOrThrow("glFramebufferTexture2D");
        GLES20.glActiveTexture(33984);
        checkGlErrorOrThrow("glActiveTexture");
        GLES20.glBindTexture(36197, this.mExternalTextureId);
        checkGlErrorOrThrow("glBindTexture");
        this.mCurrentSurface = null;
        GLES20.glViewport(0, 0, size.getWidth(), size.getHeight());
        GLES20.glScissor(0, 0, size.getWidth(), size.getHeight());
        GLES20.glUniformMatrix4fv(this.mTexMatrixLoc, 1, false, textureTransform, 0);
        checkGlErrorOrThrow("glUniformMatrix4fv");
        GLES20.glDrawArrays(5, 0, 4);
        checkGlErrorOrThrow("glDrawArrays");
        GLES20.glReadPixels(0, 0, size.getWidth(), size.getHeight(), 6408, 5121, byteBuffer);
        checkGlErrorOrThrow("glReadPixels");
        GLES20.glBindFramebuffer(36160, 0);
        deleteTexture(texture);
        deleteFbo(fbo);
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(36197, this.mExternalTextureId);
    }

    private String getGlExtensionsBeforeInitialized(DynamicRange dynamicRangeToInitialize) {
        checkInitializedOrThrow(false);
        try {
            createEglContext(dynamicRangeToInitialize);
            createTempSurface();
            makeCurrent(this.mTempSurface);
            String glExtensions = GLES20.glGetString(7939);
            return glExtensions != null ? glExtensions : "";
        } catch (IllegalStateException e) {
            Logger.w(TAG, "Failed to get GL extensions: " + e.getMessage(), e);
            return "";
        } finally {
            releaseInternal();
        }
    }

    private static int generateFbo() {
        int[] fbos = new int[1];
        GLES20.glGenFramebuffers(1, fbos, 0);
        checkGlErrorOrThrow("glGenFramebuffers");
        return fbos[0];
    }

    private static int generateTexture() {
        int[] textures = new int[1];
        GLES20.glGenTextures(1, textures, 0);
        checkGlErrorOrThrow("glGenTextures");
        return textures[0];
    }

    private static void deleteTexture(int texture) {
        int[] textures = {texture};
        GLES20.glDeleteTextures(1, textures, 0);
        checkGlErrorOrThrow("glDeleteTextures");
    }

    private static void deleteFbo(int fbo) {
        int[] fbos = {fbo};
        GLES20.glDeleteFramebuffers(1, fbos, 0);
        checkGlErrorOrThrow("glDeleteFramebuffers");
    }

    private void createEglContext(DynamicRange dynamicRange) {
        this.mEglDisplay = EGL14.eglGetDisplay(0);
        if (Objects.equals(this.mEglDisplay, EGL14.EGL_NO_DISPLAY)) {
            throw new IllegalStateException("Unable to get EGL14 display");
        }
        int[] version = new int[2];
        if (!EGL14.eglInitialize(this.mEglDisplay, version, 0, version, 1)) {
            this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
            throw new IllegalStateException("Unable to initialize EGL14");
        }
        int rgbBits = dynamicRange.is10BitHdr() ? 10 : 8;
        int alphaBits = dynamicRange.is10BitHdr() ? 2 : 8;
        int renderType = dynamicRange.is10BitHdr() ? 64 : 4;
        int recordableAndroid = !dynamicRange.is10BitHdr();
        int[] attribToChooseConfig = {12324, rgbBits, 12323, rgbBits, 12322, rgbBits, 12321, alphaBits, 12325, 0, 12326, 0, 12352, renderType, 12610, recordableAndroid, 12339, 5, 12344};
        EGLConfig[] configs = new EGLConfig[1];
        int[] numConfigs = new int[1];
        if (!EGL14.eglChooseConfig(this.mEglDisplay, attribToChooseConfig, 0, configs, 0, configs.length, numConfigs, 0)) {
            throw new IllegalStateException("Unable to find a suitable EGLConfig");
        }
        EGLConfig config = configs[0];
        int[] attribToCreateContext = {12440, dynamicRange.is10BitHdr() ? 3 : 2, 12344};
        EGLContext context = EGL14.eglCreateContext(this.mEglDisplay, config, EGL14.EGL_NO_CONTEXT, attribToCreateContext, 0);
        checkEglErrorOrThrow("eglCreateContext");
        this.mEglConfig = config;
        this.mEglContext = context;
        int[] values = new int[1];
        EGL14.eglQueryContext(this.mEglDisplay, this.mEglContext, 12440, values, 0);
        Log.d(TAG, "EGLContext created, client version " + values[0]);
    }

    private void createTempSurface() {
        this.mTempSurface = createPBufferSurface(this.mEglDisplay, (EGLConfig) Objects.requireNonNull(this.mEglConfig), 1, 1);
    }

    private void makeCurrent(EGLSurface eglSurface) {
        Preconditions.checkNotNull(this.mEglDisplay);
        Preconditions.checkNotNull(this.mEglContext);
        if (!EGL14.eglMakeCurrent(this.mEglDisplay, eglSurface, eglSurface, this.mEglContext)) {
            throw new IllegalStateException("eglMakeCurrent failed");
        }
    }

    private void createProgram(DynamicRange dynamicRange, ShaderProvider shaderProvider) {
        try {
            int vertexShader = loadShader(35633, dynamicRange.is10BitHdr() ? HDR_VERTEX_SHADER : DEFAULT_VERTEX_SHADER);
            int fragmentShader = loadFragmentShader(dynamicRange, shaderProvider);
            int program = GLES20.glCreateProgram();
            checkGlErrorOrThrow("glCreateProgram");
            GLES20.glAttachShader(program, vertexShader);
            checkGlErrorOrThrow("glAttachShader");
            GLES20.glAttachShader(program, fragmentShader);
            checkGlErrorOrThrow("glAttachShader");
            GLES20.glLinkProgram(program);
            int[] linkStatus = new int[1];
            GLES20.glGetProgramiv(program, 35714, linkStatus, 0);
            if (linkStatus[0] != 1) {
                throw new IllegalStateException("Could not link program: " + GLES20.glGetProgramInfoLog(program));
            }
            this.mProgramHandle = program;
        } catch (IllegalArgumentException | IllegalStateException e) {
            if (-1 != -1) {
                GLES20.glDeleteShader(-1);
            }
            if (-1 != -1) {
                GLES20.glDeleteShader(-1);
            }
            if (-1 != -1) {
                GLES20.glDeleteProgram(-1);
            }
            throw e;
        }
    }

    private void useAndConfigureProgram() {
        GLES20.glUseProgram(this.mProgramHandle);
        checkGlErrorOrThrow("glUseProgram");
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(36197, this.mExternalTextureId);
        GLES20.glEnableVertexAttribArray(this.mPositionLoc);
        checkGlErrorOrThrow("glEnableVertexAttribArray");
        GLES20.glVertexAttribPointer(this.mPositionLoc, 2, 5126, false, 0, (Buffer) VERTEX_BUF);
        checkGlErrorOrThrow("glVertexAttribPointer");
        GLES20.glEnableVertexAttribArray(this.mTexCoordLoc);
        checkGlErrorOrThrow("glEnableVertexAttribArray");
        GLES20.glVertexAttribPointer(this.mTexCoordLoc, 2, 5126, false, 0, (Buffer) TEX_BUF);
        checkGlErrorOrThrow("glVertexAttribPointer");
    }

    private void loadLocations() {
        this.mPositionLoc = GLES20.glGetAttribLocation(this.mProgramHandle, "aPosition");
        checkLocationOrThrow(this.mPositionLoc, "aPosition");
        this.mTexCoordLoc = GLES20.glGetAttribLocation(this.mProgramHandle, "aTextureCoord");
        checkLocationOrThrow(this.mTexCoordLoc, "aTextureCoord");
        this.mTexMatrixLoc = GLES20.glGetUniformLocation(this.mProgramHandle, "uTexMatrix");
        checkLocationOrThrow(this.mTexMatrixLoc, "uTexMatrix");
    }

    private void createTexture() {
        int[] textures = new int[1];
        GLES20.glGenTextures(1, textures, 0);
        checkGlErrorOrThrow("glGenTextures");
        int texId = textures[0];
        GLES20.glBindTexture(36197, texId);
        checkGlErrorOrThrow("glBindTexture " + texId);
        GLES20.glTexParameterf(36197, 10241, 9728.0f);
        GLES20.glTexParameterf(36197, 10240, 9729.0f);
        GLES20.glTexParameteri(36197, 10242, 33071);
        GLES20.glTexParameteri(36197, 10243, 33071);
        checkGlErrorOrThrow("glTexParameter");
        this.mExternalTextureId = texId;
    }

    private int loadFragmentShader(DynamicRange dynamicRange, ShaderProvider shaderProvider) {
        if (shaderProvider == ShaderProvider.DEFAULT) {
            return loadShader(35632, dynamicRange.is10BitHdr() ? HDR_FRAGMENT_SHADER : DEFAULT_FRAGMENT_SHADER);
        }
        try {
            String source = shaderProvider.createFragmentShader(VAR_TEXTURE, VAR_TEXTURE_COORD);
            if (source == null || !source.contains(VAR_TEXTURE_COORD) || !source.contains(VAR_TEXTURE)) {
                throw new IllegalArgumentException("Invalid fragment shader");
            }
            return loadShader(35632, source);
        } catch (Throwable t) {
            if (t instanceof IllegalArgumentException) {
                throw t;
            }
            throw new IllegalArgumentException("Unable to compile fragment shader", t);
        }
    }

    private Size getSurfaceSize(EGLSurface eglSurface) {
        int width = querySurface(this.mEglDisplay, eglSurface, 12375);
        int height = querySurface(this.mEglDisplay, eglSurface, 12374);
        return new Size(width, height);
    }

    private void releaseInternal() {
        if (this.mProgramHandle != -1) {
            GLES20.glDeleteProgram(this.mProgramHandle);
            this.mProgramHandle = -1;
        }
        if (!Objects.equals(this.mEglDisplay, EGL14.EGL_NO_DISPLAY)) {
            EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            for (OutputSurface outputSurface : this.mOutputSurfaceMap.values()) {
                if (!Objects.equals(outputSurface.getEglSurface(), EGL14.EGL_NO_SURFACE) && !EGL14.eglDestroySurface(this.mEglDisplay, outputSurface.getEglSurface())) {
                    checkEglErrorOrLog("eglDestroySurface");
                }
            }
            this.mOutputSurfaceMap.clear();
            if (!Objects.equals(this.mTempSurface, EGL14.EGL_NO_SURFACE)) {
                EGL14.eglDestroySurface(this.mEglDisplay, this.mTempSurface);
                this.mTempSurface = EGL14.EGL_NO_SURFACE;
            }
            if (!Objects.equals(this.mEglContext, EGL14.EGL_NO_CONTEXT)) {
                EGL14.eglDestroyContext(this.mEglDisplay, this.mEglContext);
                this.mEglContext = EGL14.EGL_NO_CONTEXT;
            }
            EGL14.eglReleaseThread();
            EGL14.eglTerminate(this.mEglDisplay);
            this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
        }
        this.mEglConfig = null;
        this.mProgramHandle = -1;
        this.mTexMatrixLoc = -1;
        this.mPositionLoc = -1;
        this.mTexCoordLoc = -1;
        this.mExternalTextureId = -1;
        this.mCurrentSurface = null;
        this.mGlThread = null;
    }

    private void checkInitializedOrThrow(boolean shouldInitialized) {
        boolean result = shouldInitialized == this.mInitialized.get();
        String message = shouldInitialized ? "OpenGlRenderer is not initialized" : "OpenGlRenderer is already initialized";
        Preconditions.checkState(result, message);
    }

    private void checkGlThreadOrThrow() {
        Preconditions.checkState(this.mGlThread == Thread.currentThread(), "Method call must be called on the GL thread.");
    }

    private OutputSurface getOutSurfaceOrThrow(Surface surface) {
        Preconditions.checkState(this.mOutputSurfaceMap.containsKey(surface), "The surface is not registered.");
        return (OutputSurface) Objects.requireNonNull(this.mOutputSurfaceMap.get(surface));
    }

    private static EGLSurface createPBufferSurface(EGLDisplay eglDisplay, EGLConfig eglConfig, int width, int height) {
        int[] surfaceAttrib = {12375, width, 12374, height, 12344};
        EGLSurface eglSurface = EGL14.eglCreatePbufferSurface(eglDisplay, eglConfig, surfaceAttrib, 0);
        checkEglErrorOrThrow("eglCreatePbufferSurface");
        if (eglSurface == null) {
            throw new IllegalStateException("surface was null");
        }
        return eglSurface;
    }

    private OutputSurface createOutputSurfaceInternal(Surface surface) {
        try {
            EGLSurface eglSurface = createWindowSurface(this.mEglDisplay, (EGLConfig) Objects.requireNonNull(this.mEglConfig), surface);
            Size size = getSurfaceSize(eglSurface);
            return OutputSurface.of(eglSurface, size.getWidth(), size.getHeight());
        } catch (IllegalArgumentException | IllegalStateException e) {
            Logger.w(TAG, "Failed to create EGL surface: " + e.getMessage(), e);
            return null;
        }
    }

    private void removeOutputSurfaceInternal(Surface surface, boolean unregister) {
        OutputSurface removedOutputSurface;
        if (this.mCurrentSurface == surface) {
            this.mCurrentSurface = null;
            makeCurrent(this.mTempSurface);
        }
        Map<Surface, OutputSurface> map = this.mOutputSurfaceMap;
        if (unregister) {
            removedOutputSurface = map.remove(surface);
        } else {
            removedOutputSurface = map.put(surface, NO_OUTPUT_SURFACE);
        }
        if (removedOutputSurface != null && removedOutputSurface != NO_OUTPUT_SURFACE) {
            try {
                EGL14.eglDestroySurface(this.mEglDisplay, removedOutputSurface.getEglSurface());
            } catch (RuntimeException e) {
                Logger.w(TAG, "Failed to destroy EGL surface: " + e.getMessage(), e);
            }
        }
    }

    private static EGLSurface createWindowSurface(EGLDisplay eglDisplay, EGLConfig eglConfig, Surface surface) {
        int[] surfaceAttrib = {12344};
        EGLSurface eglSurface = EGL14.eglCreateWindowSurface(eglDisplay, eglConfig, surface, surfaceAttrib, 0);
        checkEglErrorOrThrow("eglCreateWindowSurface");
        if (eglSurface == null) {
            throw new IllegalStateException("surface was null");
        }
        return eglSurface;
    }

    private static int loadShader(int shaderType, String source) {
        int shader = GLES20.glCreateShader(shaderType);
        checkGlErrorOrThrow("glCreateShader type=" + shaderType);
        GLES20.glShaderSource(shader, source);
        GLES20.glCompileShader(shader);
        int[] compiled = new int[1];
        GLES20.glGetShaderiv(shader, 35713, compiled, 0);
        if (compiled[0] == 0) {
            Logger.w(TAG, "Could not compile shader: " + source);
            GLES20.glDeleteShader(shader);
            throw new IllegalStateException("Could not compile shader type " + shaderType + ":" + GLES20.glGetShaderInfoLog(shader));
        }
        return shader;
    }

    private static int querySurface(EGLDisplay eglDisplay, EGLSurface eglSurface, int what) {
        int[] value = new int[1];
        EGL14.eglQuerySurface(eglDisplay, eglSurface, what, value, 0);
        return value[0];
    }

    public static FloatBuffer createFloatBuffer(float[] coords) {
        ByteBuffer bb = ByteBuffer.allocateDirect(coords.length * 4);
        bb.order(ByteOrder.nativeOrder());
        FloatBuffer fb = bb.asFloatBuffer();
        fb.put(coords);
        fb.position(0);
        return fb;
    }

    private static void checkLocationOrThrow(int location, String label) {
        if (location < 0) {
            throw new IllegalStateException("Unable to locate '" + label + "' in program");
        }
    }

    private static void checkEglErrorOrThrow(String op) {
        int error = EGL14.eglGetError();
        if (error != 12288) {
            throw new IllegalStateException(op + ": EGL error: 0x" + Integer.toHexString(error));
        }
    }

    private static void checkEglErrorOrLog(String op) {
        try {
            checkEglErrorOrThrow(op);
        } catch (IllegalStateException e) {
            Logger.e(TAG, e.toString(), e);
        }
    }

    private static void checkGlErrorOrThrow(String op) {
        int error = GLES20.glGetError();
        if (error != 0) {
            throw new IllegalStateException(op + ": GL error 0x" + Integer.toHexString(error));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class OutputSurface {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract EGLSurface getEglSurface();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getHeight();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getWidth();

        static OutputSurface of(EGLSurface eglSurface, int width, int height) {
            return new AutoValue_OpenGlRenderer_OutputSurface(eglSurface, width, height);
        }
    }
}
