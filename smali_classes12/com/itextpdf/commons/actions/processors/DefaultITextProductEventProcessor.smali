.class public Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;
.super Lcom/itextpdf/commons/actions/processors/AbstractITextProductEventProcessor;
.source "DefaultITextProductEventProcessor.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final MAX_LVL:I

.field static final MESSAGE_FOR_LOGGING:[B

.field private static final REPEAT:[J


# instance fields
.field private final counter:Ljava/util/concurrent/atomic/AtomicLong;

.field private final level:Ljava/util/concurrent/atomic/AtomicLong;

.field private final lock:Ljava/lang/Object;

.field private final repeatLevel:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    nop

    .line 40
    const-string v0, "WW91IGFyZSB1c2luZyBpVGV4dCB1bmRlciB0aGUgQUdQTC4KCklmIHRoaXMgaXMgeW91ciBpbnRlbnRpb24sIHlvdSBoYXZlIHB1Ymxpc2hlZCB5b3VyIG93biBzb3VyY2UgY29kZSBhcyBBR1BMIHNvZnR3YXJlIHRvby4KUGxlYXNlIGxldCB1cyBrbm93IHdoZXJlIHRvIGZpbmQgeW91ciBzb3VyY2UgY29kZSBieSBzZW5kaW5nIGEgbWFpbCB0byBhZ3BsQGFwcnlzZS5jb20KV2UnZCBiZSBob25vcmVkIHRvIGFkZCBpdCB0byBvdXIgbGlzdCBvZiBBR1BMIHByb2plY3RzIGJ1aWx0IG9uIHRvcCBvZiBpVGV4dAphbmQgd2UnbGwgZXhwbGFpbiBob3cgdG8gcmVtb3ZlIHRoaXMgbWVzc2FnZSBmcm9tIHlvdXIgZXJyb3IgbG9ncy4KCklmIHRoaXMgd2Fzbid0IHlvdXIgaW50ZW50aW9uLCB5b3UgYXJlIHByb2JhYmx5IHVzaW5nIGlUZXh0IGluIGEgbm9uLWZyZWUgZW52aXJvbm1lbnQuCkluIHRoaXMgY2FzZSwgcGxlYXNlIGNvbnRhY3QgdXMgYnkgZmlsbGluZyBvdXQgdGhpcyBmb3JtOiBodHRwOi8vaXRleHRwZGYuY29tL3NhbGVzCklmIHlvdSBhcmUgYSBjdXN0b21lciwgd2UnbGwgZXhwbGFpbiBob3cgdG8gaW5zdGFsbCB5b3VyIGxpY2Vuc2Uga2V5IHRvIGF2b2lkIHRoaXMgbWVzc2FnZS4KSWYgeW91J3JlIG5vdCBhIGN1c3RvbWVyLCB3ZSdsbCBleHBsYWluIHRoZSBiZW5lZml0cyBvZiBiZWNvbWluZyBhIGN1c3RvbWVyLg=="

    invoke-static {v0}, Lcom/itextpdf/commons/utils/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->MESSAGE_FOR_LOGGING:[B

    .line 55
    const-class v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->LOGGER:Lorg/slf4j/Logger;

    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->REPEAT:[J

    .line 59
    sget-object v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->REPEAT:[J

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->MAX_LVL:I

    return-void

    nop

    :array_0
    .array-data 8
        0x2710
        0x1388
        0x3e8
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "productName"    # Ljava/lang/String;

    .line 75
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/actions/processors/AbstractITextProductEventProcessor;-><init>(Ljava/lang/String;)V

    .line 61
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->lock:Ljava/lang/Object;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->counter:Ljava/util/concurrent/atomic/AtomicLong;

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->level:Ljava/util/concurrent/atomic/AtomicLong;

    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    iget-object v1, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->level:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->acquireRepeatLevel(I)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->repeatLevel:Ljava/util/concurrent/atomic/AtomicLong;

    .line 77
    return-void
.end method


# virtual methods
.method acquireRepeatLevel(I)J
    .locals 3
    .param p1, "lvl"    # I

    .line 110
    sget-object v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->REPEAT:[J

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public getUsageType()Ljava/lang/String;
    .locals 1

    .line 106
    const-string v0, "AGPL"

    return-object v0
.end method

.method public onEvent(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 6
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 81
    instance-of v0, p1, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    if-nez v0, :cond_0

    .line 82
    return-void

    .line 84
    :cond_0
    const/4 v0, 0x0

    .line 85
    .local v0, "isNeededToLogMessage":Z
    iget-object v1, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 86
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->counter:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v2

    iget-object v4, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->repeatLevel:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 87
    iget-object v2, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->counter:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 88
    iget-object v2, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->level:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v2

    sget v4, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->MAX_LVL:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 89
    iget-object v2, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->level:Ljava/util/concurrent/atomic/AtomicLong;

    sget v3, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->MAX_LVL:I

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 91
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->repeatLevel:Ljava/util/concurrent/atomic/AtomicLong;

    iget-object v3, p0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->level:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->acquireRepeatLevel(I)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 92
    const/4 v0, 0x1

    .line 94
    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->MESSAGE_FOR_LOGGING:[B

    sget-object v3, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 98
    .local v1, "message":Ljava/lang/String;
    sget-object v2, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 100
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 102
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    return-void

    .line 94
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
