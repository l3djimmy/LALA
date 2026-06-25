.class public Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;
.super Ljava/lang/Object;
.source "XMPNormalizer.java"


# static fields
.field private static dcArrayForms:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 61
    invoke-static {}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->initDCArrays()V

    .line 62
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    return-void
.end method

.method private static compareAliasedSubtrees(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)V
    .locals 5
    .param p0, "aliasNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "baseNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "outerCall"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 545
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0xcb

    const-string v2, "Mismatch between alias and base nodes"

    if-eqz v0, :cond_4

    .line 546
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v3

    if-ne v0, v3, :cond_4

    .line 551
    if-nez p2, :cond_1

    .line 553
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 554
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 555
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v3

    if-ne v0, v3, :cond_0

    goto :goto_0

    .line 558
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 562
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .line 563
    .local v0, "an":Ljava/util/Iterator;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .line 564
    .local v1, "bn":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 566
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 567
    .local v2, "aliasChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 568
    .local v4, "baseChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v2, v4, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)V

    .line 569
    .end local v2    # "aliasChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "baseChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_1

    .line 572
    .end local v0    # "an":Ljava/util/Iterator;
    .end local v1    # "bn":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    .line 573
    .restart local v0    # "an":Ljava/util/Iterator;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v1

    .line 574
    .restart local v1    # "bn":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 576
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 577
    .local v2, "aliasQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 578
    .local v4, "baseQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v2, v4, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)V

    .line 579
    .end local v2    # "aliasQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "baseQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_2

    .line 580
    .end local v0    # "an":Ljava/util/Iterator;
    .end local v1    # "bn":Ljava/util/Iterator;
    :cond_3
    return-void

    .line 548
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static deleteEmptySchemas(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 3
    .param p0, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 521
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 523
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 524
    .local v1, "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v2

    if-nez v2, :cond_0

    .line 526
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 528
    .end local v1    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    goto :goto_0

    .line 529
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method private static fixGPSTimeStamp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 7
    .param p0, "exifSchema"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 469
    const-string v0, "exif:GPSTimeStamp"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 470
    .local v0, "gpsDateTime":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v0, :cond_0

    .line 472
    return-void

    .line 480
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v2

    .line 481
    .local v2, "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getYear()I

    move-result v3

    if-nez v3, :cond_3

    .line 482
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getMonth()I

    move-result v3

    if-nez v3, :cond_3

    .line 483
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getDay()I

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 488
    :cond_1
    const-string v3, "exif:DateTimeOriginal"

    invoke-static {p0, v3, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 490
    .local v3, "otherDate":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v3, :cond_2

    .line 492
    const-string v4, "exif:DateTimeDigitized"

    invoke-static {p0, v4, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    move-object v3, v1

    .line 495
    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v1

    .line 496
    .local v1, "binOtherDate":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v4

    .line 497
    .local v4, "cal":Ljava/util/Calendar;
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getYear()I

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v4, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 498
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getMonth()I

    move-result v5

    const/4 v6, 0x2

    invoke-virtual {v4, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 499
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getDay()I

    move-result v5

    const/4 v6, 0x5

    invoke-virtual {v4, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 500
    new-instance v5, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v5, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    .line 501
    .end local v2    # "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .local v5, "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-static {v5}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromDate(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 507
    .end local v1    # "binOtherDate":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .end local v3    # "otherDate":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "cal":Ljava/util/Calendar;
    .end local v5    # "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    nop

    .line 508
    return-void

    .line 485
    .restart local v2    # "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    :cond_3
    :goto_0
    return-void

    .line 503
    .end local v2    # "binGPSStamp":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    :catch_0
    move-exception v1

    .line 506
    .local v1, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    return-void
.end method

.method private static initDCArrays()V
    .locals 5

    .line 687
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    .line 690
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 691
    .local v0, "bagForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 692
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:contributor"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:language"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:publisher"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:relation"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:subject"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v3, "dc:type"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    new-instance v2, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 701
    .local v2, "seqForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 702
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 703
    sget-object v3, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:creator"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    sget-object v3, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:date"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    new-instance v3, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 708
    .local v3, "altTextForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 709
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 710
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 711
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 712
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:description"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:rights"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:title"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    return-void
.end method

.method private static migrateAudioCopyright(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 22
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "dmCopyright"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 615
    const-string/jumbo v0, "x-default"

    :try_start_0
    move-object/from16 v1, p0

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 616
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    const-string v2, "http://purl.org/dc/elements/1.1/"

    .line 615
    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 618
    .local v1, "dcSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 619
    .local v2, "dmValue":Ljava/lang/String;
    const-string v4, "\n\n"

    .line 621
    .local v4, "doubleLF":Ljava/lang/String;
    const-string v5, "dc:rights"

    const/4 v6, 0x0

    invoke-static {v1, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v5

    .line 623
    .local v5, "dcRightsArray":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v7

    if-nez v7, :cond_0

    goto/16 :goto_0

    .line 632
    :cond_0
    invoke-static {v5, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v7

    .line 634
    .local v7, "xdIndex":I
    if-gez v7, :cond_1

    .line 637
    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    move-object v13, v3

    .line 638
    .local v13, "firstValue":Ljava/lang/String;
    const-string v9, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v10, "rights"

    const-string v11, ""

    const-string/jumbo v12, "x-default"

    const/4 v14, 0x0

    move-object/from16 v8, p0

    invoke-interface/range {v8 .. v14}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 640
    invoke-static {v5, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v0

    move v7, v0

    .line 644
    .end local v13    # "firstValue":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 645
    .local v0, "defaultNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 646
    .local v3, "defaultValue":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 648
    .local v8, "lfPos":I
    if-gez v8, :cond_2

    .line 651
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 655
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 661
    :cond_2
    add-int/lit8 v9, v8, 0x2

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 664
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v10, v8, 0x2

    invoke-virtual {v3, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 626
    .end local v0    # "defaultNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "defaultValue":Ljava/lang/String;
    .end local v7    # "xdIndex":I
    .end local v8    # "lfPos":I
    :cond_3
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 627
    .end local v2    # "dmValue":Ljava/lang/String;
    .local v20, "dmValue":Ljava/lang/String;
    const-string v16, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v17, "rights"

    const-string v18, ""

    const-string/jumbo v19, "x-default"

    const/16 v21, 0x0

    move-object/from16 v15, p0

    invoke-interface/range {v15 .. v21}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    move-object/from16 v2, v20

    .line 671
    .end local v20    # "dmValue":Ljava/lang/String;
    .restart local v2    # "dmValue":Ljava/lang/String;
    :cond_4
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v3, p1

    :try_start_1
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    :try_end_1
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_1 .. :try_end_1} :catch_0

    .line 677
    .end local v1    # "dcSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "dmValue":Ljava/lang/String;
    .end local v4    # "doubleLF":Ljava/lang/String;
    .end local v5    # "dcRightsArray":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_2

    .line 673
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v3, p1

    .line 678
    :goto_2
    return-void
.end method

.method private static moveExplicitAliases(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)V
    .locals 13
    .param p0, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 314
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getHasAliases()Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    return-void

    .line 318
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasAliases(Z)V

    .line 320
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getStrictAliasing()Z

    move-result v1

    .line 322
    .local v1, "strictAliasing":Z
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getUnmodifiableChildren()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "schemaIt":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 324
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 325
    .local v3, "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getHasAliases()Z

    move-result v4

    if-nez v4, :cond_1

    .line 327
    goto :goto_0

    .line 330
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "propertyIt":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 332
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 334
    .local v5, "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isAlias()Z

    move-result v6

    if-nez v6, :cond_2

    .line 336
    goto :goto_1

    .line 339
    :cond_2
    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setAlias(Z)V

    .line 342
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v6

    .line 343
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    move-result-object v6

    .line 344
    .local v6, "info":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    if-eqz v6, :cond_c

    .line 347
    nop

    .line 348
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 347
    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-static {p0, v7, v8, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v7

    .line 349
    .local v7, "baseSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 351
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 353
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 352
    invoke-static {v7, v8, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v8

    .line 354
    .local v8, "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v8, :cond_4

    .line 356
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->isSimple()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 360
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 361
    .local v9, "qname":Ljava/lang/String;
    invoke-virtual {v5, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 362
    invoke-virtual {v7, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 364
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 365
    .end local v9    # "qname":Ljava/lang/String;
    goto/16 :goto_3

    .line 370
    :cond_3
    new-instance v9, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 371
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->toPropertyOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 372
    .end local v8    # "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v9, "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v7, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 373
    invoke-static {v4, v5, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_3

    .line 377
    .end local v9    # "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v8    # "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_4
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->isSimple()Z

    move-result v10

    if-eqz v10, :cond_6

    .line 382
    if-eqz v1, :cond_5

    .line 384
    invoke-static {v5, v8, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)V

    .line 387
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    .line 395
    :cond_6
    const/4 v10, 0x0

    .line 396
    .local v10, "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->isArrayAltText()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 398
    const-string/jumbo v11, "x-default"

    invoke-static {v8, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v11

    .line 400
    .local v11, "xdIndex":I
    const/4 v12, -0x1

    if-eq v11, v12, :cond_7

    .line 402
    invoke-virtual {v8, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v10

    .line 404
    .end local v11    # "xdIndex":I
    :cond_7
    goto :goto_2

    .line 405
    :cond_8
    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 407
    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v10

    .line 410
    :cond_9
    :goto_2
    if-nez v10, :cond_a

    .line 412
    invoke-static {v4, v5, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_3

    .line 416
    :cond_a
    if-eqz v1, :cond_b

    .line 418
    invoke-static {v5, v10, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)V

    .line 421
    :cond_b
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 425
    .end local v5    # "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v6    # "info":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .end local v7    # "baseSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v8    # "baseNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v10    # "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_c
    :goto_3
    goto/16 :goto_1

    .line 426
    .end local v4    # "propertyIt":Ljava/util/Iterator;
    :cond_d
    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasAliases(Z)V

    .line 427
    .end local v3    # "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto/16 :goto_0

    .line 428
    .end local v2    # "schemaIt":Ljava/util/Iterator;
    :cond_e
    return-void
.end method

.method private static normalizeDCArrays(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 8
    .param p0, "dcSchema"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 209
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-gt v0, v1, :cond_4

    .line 211
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 213
    .local v1, "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 214
    .local v2, "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    if-nez v2, :cond_0

    .line 216
    goto :goto_1

    .line 218
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSimple()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 222
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 223
    .local v3, "newArray":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const-string v4, "[]"

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 225
    invoke-virtual {p0, v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->replaceChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 228
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v4

    if-nez v4, :cond_1

    .line 230
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string/jumbo v5, "x-default"

    const/4 v6, 0x0

    const-string/jumbo v7, "xml:lang"

    invoke-direct {v4, v7, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 231
    .local v4, "newLang":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 233
    .end local v3    # "newArray":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "newLang":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    goto :goto_1

    .line 237
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    const/16 v4, 0x1e00

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 243
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->mergeWith(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 245
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 248
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->repairAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 209
    .end local v1    # "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 253
    .end local v0    # "i":I
    :cond_4
    return-void
.end method

.method static process(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 85
    .local v0, "tree":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->touchUpDataModel(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;)V

    .line 86
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->moveExplicitAliases(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)V

    .line 88
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->tweakOldXMP(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 90
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->deleteEmptySchemas(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 92
    return-object p0
.end method

.method private static repairAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 7
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 265
    if-eqz p0, :cond_6

    .line 266
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_3

    .line 273
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 275
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 277
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 278
    .local v1, "currChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 281
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 283
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-nez v2, :cond_4

    .line 285
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 286
    .local v2, "childValue":Ljava/lang/String;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    .line 294
    :cond_2
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string/jumbo v4, "x-repair"

    const/4 v5, 0x0

    const-string/jumbo v6, "xml:lang"

    invoke-direct {v3, v6, v4, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 295
    .local v3, "repairLang":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_2

    .line 289
    .end local v3    # "repairLang":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 298
    .end local v1    # "currChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "childValue":Ljava/lang/String;
    :cond_4
    :goto_2
    goto :goto_0

    .line 299
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_5
    return-void

    .line 269
    :cond_6
    :goto_3
    return-void
.end method

.method private static touchUpDataModel(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;)V
    .locals 6
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 152
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "http://purl.org/dc/elements/1.1/"

    invoke-static {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 155
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 157
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 158
    .local v1, "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 160
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->normalizeDCArrays(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_1

    .line 162
    :cond_0
    const-string v3, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    .line 165
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->fixGPSTimeStamp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 166
    const-string v3, "exif:UserComment"

    invoke-static {v1, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 168
    .local v3, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_1

    .line 170
    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->repairAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 172
    .end local v3    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    goto :goto_1

    .line 173
    :cond_2
    const-string v3, "http://ns.adobe.com/xmp/1.0/DynamicMedia/"

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 177
    const-string/jumbo v3, "xmpDM:copyright"

    invoke-static {v1, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 179
    .local v3, "dmCopyright":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_3

    .line 181
    invoke-static {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->migrateAudioCopyright(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 183
    .end local v3    # "dmCopyright":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    goto :goto_1

    .line 184
    :cond_4
    const-string v3, "http://ns.adobe.com/xap/1.0/rights/"

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 186
    const-string/jumbo v3, "xmpRights:UsageTerms"

    invoke-static {v1, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 188
    .local v3, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_5

    .line 190
    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->repairAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 193
    .end local v1    # "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    :goto_1
    goto :goto_0

    .line 194
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_6
    return-void
.end method

.method private static transplantArrayItemAlias(Ljava/util/Iterator;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 4
    .param p0, "propertyIt"    # Ljava/util/Iterator;
    .param p1, "childNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "baseArray"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 441
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 443
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v0

    if-nez v0, :cond_0

    .line 449
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string/jumbo v1, "x-default"

    const/4 v2, 0x0

    const-string/jumbo v3, "xml:lang"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 450
    .local v0, "langQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 445
    .end local v0    # "langQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Alias to x-default already has a language qualifier"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 453
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 454
    const-string v0, "[]"

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 455
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 456
    return-void
.end method

.method private static tweakOldXMP(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 6
    .param p0, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x24

    if-lt v0, v1, :cond_2

    .line 113
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "nameStr":Ljava/lang/String;
    const-string/jumbo v1, "uuid:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 119
    :cond_0
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->checkUUIDFormat(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 122
    const-string v2, "http://ns.adobe.com/xap/1.0/mm/"

    const-string v3, "InstanceID"

    invoke-static {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v2

    .line 123
    .local v2, "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 124
    .local v3, "idNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_1

    .line 126
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 127
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChildren()V

    .line 129
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeQualifiers()V

    .line 130
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 134
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Failure creating xmpMM:InstanceID"

    const/16 v5, 0x9

    invoke-direct {v1, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 139
    .end local v0    # "nameStr":Ljava/lang/String;
    .end local v2    # "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v3    # "idNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_2
    :goto_0
    return-void
.end method
