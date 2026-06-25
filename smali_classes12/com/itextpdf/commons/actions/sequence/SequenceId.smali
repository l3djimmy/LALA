.class public final Lcom/itextpdf/commons/actions/sequence/SequenceId;
.super Ljava/lang/Object;
.source "SequenceId.java"


# static fields
.field private static final ID_GENERATOR:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private final id:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;->ID_GENERATOR:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    sget-object v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;->ID_GENERATOR:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/itextpdf/commons/actions/sequence/SequenceId;->id:J

    .line 40
    return-void
.end method


# virtual methods
.method public getId()J
    .locals 2

    .line 48
    iget-wide v0, p0, Lcom/itextpdf/commons/actions/sequence/SequenceId;->id:J

    return-wide v0
.end method
