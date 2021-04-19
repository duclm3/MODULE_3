package com.cakemanager.model;

public class BlogCategory {
    private int blogCateId;
    private String blogName;

    public BlogCategory(String blogCateName) {
    }

    public BlogCategory(int blogCateId, String blogName) {
        this.blogCateId = blogCateId;
        this.blogName = blogName;
    }

    public int getBlogCateId() {
        return blogCateId;
    }

    public void setBlogCateId(int blogCateId) {
        this.blogCateId = blogCateId;
    }

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    @Override
    public String toString() {
        return "BlogCategory{" +
                "blogCateId=" + blogCateId +
                ", blogName='" + blogName + '\'' +
                '}';
    }
}
