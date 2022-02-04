package com.tools;

import java.sql.Timestamp;

public class News {
    private Long id;
    private Timestamp postDate;
    private Long categoryId;

    public News() {

    }

    public News(Long id, Timestamp postDate, Long categoryId) {
        this.id = id;
        this.postDate = postDate;
        this.categoryId = categoryId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
}