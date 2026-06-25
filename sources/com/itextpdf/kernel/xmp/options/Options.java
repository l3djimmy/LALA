package com.itextpdf.kernel.xmp.options;

import com.itextpdf.kernel.xmp.XMPException;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public abstract class Options {
    private int options = 0;
    private Map optionNames = null;

    protected abstract String defineOptionName(int i);

    protected abstract int getValidOptions();

    public Options() {
    }

    public Options(int options) throws XMPException {
        assertOptionsValid(options);
        setOptions(options);
    }

    public void clear() {
        this.options = 0;
    }

    public boolean isExactly(int optionBits) {
        return getOptions() == optionBits;
    }

    public boolean containsAllOptions(int optionBits) {
        return (getOptions() & optionBits) == optionBits;
    }

    public boolean containsOneOf(int optionBits) {
        return (getOptions() & optionBits) != 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean getOption(int optionBit) {
        return (this.options & optionBit) != 0;
    }

    public void setOption(int optionBits, boolean value) {
        int i = this.options;
        this.options = value ? i | optionBits : i & (~optionBits);
    }

    public int getOptions() {
        return this.options;
    }

    public void setOptions(int options) throws XMPException {
        assertOptionsValid(options);
        this.options = options;
    }

    public boolean equals(Object obj) {
        return getOptions() == ((Options) obj).getOptions();
    }

    public int hashCode() {
        return getOptions();
    }

    public String getOptionsString() {
        if (this.options != 0) {
            StringBuffer sb = new StringBuffer();
            int theBits = this.options;
            while (theBits != 0) {
                int oneLessBit = (theBits - 1) & theBits;
                int singleBit = theBits ^ oneLessBit;
                String bitName = getOptionName(singleBit);
                sb.append(bitName);
                if (oneLessBit != 0) {
                    sb.append(" | ");
                }
                theBits = oneLessBit;
            }
            return sb.toString();
        }
        return "<none>";
    }

    public String toString() {
        return "0x" + Integer.toHexString(this.options);
    }

    protected void assertConsistency(int options) throws XMPException {
    }

    private void assertOptionsValid(int options) throws XMPException {
        int invalidOptions = (~getValidOptions()) & options;
        if (invalidOptions == 0) {
            assertConsistency(options);
            return;
        }
        throw new XMPException("The option bit(s) 0x" + Integer.toHexString(invalidOptions) + " are invalid!", 103);
    }

    private String getOptionName(int option) {
        HashMap optionsNames = procureOptionNames();
        Integer key = new Integer(option);
        if (!optionsNames.containsKey(key)) {
            return null;
        }
        String result = defineOptionName(option);
        if (result != null) {
            optionsNames.put(key, result);
            return result;
        }
        return "<option name not defined>";
    }

    private HashMap procureOptionNames() {
        if (this.optionNames == null) {
            this.optionNames = new HashMap();
        }
        return (HashMap) this.optionNames;
    }
}
