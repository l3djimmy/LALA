package androidx.constraintlayout.core.motion.utils;
/* loaded from: classes11.dex */
public class Schlick extends Easing {
    private static final boolean DEBUG = false;
    double mEps;
    double mS;
    double mT;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Schlick(String configString) {
        this.mStr = configString;
        int start = configString.indexOf(40);
        int off1 = configString.indexOf(44, start);
        this.mS = Double.parseDouble(configString.substring(start + 1, off1).trim());
        int off2 = configString.indexOf(44, off1 + 1);
        this.mT = Double.parseDouble(configString.substring(off1 + 1, off2).trim());
    }

    private double func(double x) {
        int i = (x > this.mT ? 1 : (x == this.mT ? 0 : -1));
        double d = this.mT;
        if (i < 0) {
            return (d * x) / ((this.mS * (this.mT - x)) + x);
        }
        return ((1.0d - d) * (x - 1.0d)) / ((1.0d - x) - (this.mS * (this.mT - x)));
    }

    private double dfunc(double x) {
        int i = (x > this.mT ? 1 : (x == this.mT ? 0 : -1));
        double d = this.mS;
        if (i < 0) {
            return ((d * this.mT) * this.mT) / (((this.mS * (this.mT - x)) + x) * ((this.mS * (this.mT - x)) + x));
        }
        return ((d * (this.mT - 1.0d)) * (this.mT - 1.0d)) / (((((-this.mS) * (this.mT - x)) - x) + 1.0d) * ((((-this.mS) * (this.mT - x)) - x) + 1.0d));
    }

    @Override // androidx.constraintlayout.core.motion.utils.Easing
    public double getDiff(double x) {
        return dfunc(x);
    }

    @Override // androidx.constraintlayout.core.motion.utils.Easing
    public double get(double x) {
        return func(x);
    }
}
