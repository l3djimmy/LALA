package com.itextpdf.layout.hyphenation;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
public class HyphenationTreeCache {
    private Map<String, HyphenationTree> hyphenTrees = new HashMap();
    private Set<String> missingHyphenationTrees;

    public HyphenationTree getHyphenationTree(String lang, String country) {
        String key = constructLlccKey(lang, country);
        if (key == null) {
            return null;
        }
        boolean containsKey = this.hyphenTrees.containsKey(key);
        Map<String, HyphenationTree> map = this.hyphenTrees;
        if (containsKey) {
            return map.get(key);
        }
        if (!map.containsKey(lang)) {
            return null;
        }
        return this.hyphenTrees.get(lang);
    }

    public static String constructLlccKey(String lang, String country) {
        if (country == null || country.equals("none")) {
            return lang;
        }
        String key = lang + "_" + country;
        return key;
    }

    public static String constructUserKey(String lang, String country, Map<String, String> hyphPatNames) {
        if (hyphPatNames == null) {
            return null;
        }
        String key = constructLlccKey(lang, country);
        String userKey = hyphPatNames.get(key.replace('_', '-'));
        return userKey;
    }

    public void cache(String key, HyphenationTree hTree) {
        this.hyphenTrees.put(key, hTree);
    }

    public void noteMissing(String key) {
        if (this.missingHyphenationTrees == null) {
            this.missingHyphenationTrees = new HashSet();
        }
        this.missingHyphenationTrees.add(key);
    }

    public boolean isMissing(String key) {
        return this.missingHyphenationTrees != null && this.missingHyphenationTrees.contains(key);
    }
}
