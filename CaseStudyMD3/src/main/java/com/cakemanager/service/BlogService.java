package com.cakemanager.service;

import com.cakemanager.model.Blog;
import com.cakemanager.model.BlogCategory;
import com.cakemanager.model.Category;
import com.cakemanager.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BlogService {
    private static final String SELECT_ALL_BLOG_CATE = "select * from blogcategory;";
    private static final String SELECT_ALL_BLOGS = "select * from blogs;";
    private static final String SELECT_BLOG_BY_CID = "select * from blogs where blogCateId = ?;";
    private static final String SELECT_LATEST_BLOG_TOP4_BY_ID = "select * from blogs order by blogId desc limit 4;";
    private static final String COUNT_BLOG_BY_CID = "select count(blogCateId) from blogs group by blogCateId having blogCateId = ?;";
    private static final String SELECT_BLOG_BY_BID = "select * from blogs where blogId = ?;";
    private static final String SELECT_CNAME_BY_BID = "select blogCateName from blogs, blogcategory where blogs.blogCateId = blogcategory.blogCateId and blogId = ?";


    public List<BlogCategory> selectAllBlogCate() {
        List<BlogCategory> list = new ArrayList<>();

        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_BLOG_CATE)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int blogCateId = rs.getInt("blogCateId");
                String blogCateName = rs.getString("blogCateName");
                list.add(new BlogCategory(blogCateId, blogCateName));
            }
        } catch (Exception e) {
        }
        return list;
    }


    public List<Blog> selectAllBlogs() {
        List<Blog> list = new ArrayList<>();

        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_BLOGS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getString("title");
                String descriptionShort = rs.getString("descriptionShort");
                String content = rs.getString("content");
                Date datePost = rs.getDate("datePost");
                int blogCateId = rs.getInt("blogCateId");
                String img = rs.getString("img");

                list.add(new Blog(blogId, title, descriptionShort, content, datePost, blogCateId, img));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> selectBlogsByCId(int blogCId) {
        List<Blog> list = new ArrayList<>();
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BLOG_BY_CID);) {
            preparedStatement.setInt(1, blogCId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getString("title");
                String descriptionShort = rs.getString("descriptionShort");
                String content = rs.getString("content");
                Date datePost = rs.getDate("datePost");
                int blogCateId = rs.getInt("blogCateId");
                String img = rs.getString("img");

                list.add(new Blog(blogId, title, descriptionShort, content, datePost, blogCateId, img));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Blog> selectLatestBlogTop4ById() {
        List<Blog> list = new ArrayList<>();
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LATEST_BLOG_TOP4_BY_ID);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getString("title");
                String descriptionShort = rs.getString("descriptionShort");
                String content = rs.getString("content");
                Date datePost = rs.getDate("datePost");
                int blogCateId = rs.getInt("blogCateId");
                String img = rs.getString("img");

                list.add(new Blog(blogId, title, descriptionShort, content, datePost, blogCateId, img));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ResultSet countBlogByCId(int blogCId) throws SQLException {
        Connection connection = DatabaseConection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(COUNT_BLOG_BY_CID);
        preparedStatement.setInt(1, blogCId);
        ResultSet rs = preparedStatement.executeQuery();
        return rs;
    }


    public Blog selectBlogById(int blogId) {
        Blog blog = null;

        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_BLOG_BY_BID);) {
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int bId = rs.getInt("blogId");
                String title = rs.getString("title");
                String descriptionShort = rs.getString("descriptionShort");
                String content = rs.getString("content");
                Date datePost = rs.getDate("datePost");
                int blogCateId = rs.getInt("blogCateId");
                String img = rs.getString("img");

                blog = new Blog(bId, title, descriptionShort, content, datePost, blogCateId, img);
            }
        } catch (SQLException e) {

        }
        return blog;
    }


    public BlogCategory selectBCateByBId(int blogId) {
        BlogCategory blogCategory = null;
        try (Connection connection = DatabaseConection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CNAME_BY_BID);) {
            preparedStatement.setInt(1, blogId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String blogCateName = rs.getString("blogCateName");
                blogCategory= new BlogCategory(blogCateName);
            }
        } catch (SQLException e) {

        }
        return blogCategory;
    }
}
