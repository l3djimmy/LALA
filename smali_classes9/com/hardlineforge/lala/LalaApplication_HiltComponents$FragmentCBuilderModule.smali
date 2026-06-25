.class interface abstract Lcom/hardlineforge/lala/LalaApplication_HiltComponents$FragmentCBuilderModule;
.super Ljava/lang/Object;
.source "LalaApplication_HiltComponents.java"


# annotations
.annotation runtime Ldagger/Module;
    subcomponents = {
        Lcom/hardlineforge/lala/LalaApplication_HiltComponents$FragmentC;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/LalaApplication_HiltComponents;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "FragmentCBuilderModule"
.end annotation


# virtual methods
.method public abstract bind(Lcom/hardlineforge/lala/LalaApplication_HiltComponents$FragmentC$Builder;)Ldagger/hilt/android/internal/builders/FragmentComponentBuilder;
    .annotation runtime Ldagger/Binds;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation
.end method
