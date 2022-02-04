package com.tools;

public class NewsContent {

    private Long id;
    private String text;
    private String content;
    private Long newsId;
    private Long languageId;

    public NewsContent() {

    }

    public NewsContent(Long id, String text, String content, Long newsId, Long languageId) {
        this.id = id;
        this.text = text;
        this.content = content;
        this.newsId = newsId;
        this.languageId = languageId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public Long getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Long languageId) {
        this.languageId = languageId;
    }
}
