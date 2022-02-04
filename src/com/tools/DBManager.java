package com.tools;

import java.sql.*;
import java.time.Period;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/big_project?useUnicode=true&serverTimezone=UTC","root","");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static boolean addUser(User user){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users(id, email, password, full_name, role_id)" +
                    "VALUES (null, ?, ?, ?, ?)");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setString(4, user.getRoleId());

            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static User getUser(String email){
        User user = null;
        try {

            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                user = new User(resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("role_id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static ArrayList<User> getUsers(){
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                users.add(new User(resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("role_id")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static boolean editUser(User user){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET email = ?, password = ?, full_name = ? "+
                    "WHERE id = ?");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3,user.getFullName());
            statement.setLong(4, user.getId());

            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static boolean addCategory(NewsCategory newsCategory){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news_categories(id, name) "+
                    "VALUES (null, ?)");
            statement.setString(1,newsCategory.getName());

            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static NewsCategory getCategory(Long id){
        NewsCategory newsCategory = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news_categories "+
                    "WHERE id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                newsCategory = new NewsCategory(resultSet.getLong("id"),
                        resultSet.getString("name"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return newsCategory;
    }

    public static ArrayList<NewsCategory> getCategories(){
        ArrayList<NewsCategory> newsCategories = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news_categories " +
                    "ORDER BY id");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                newsCategories.add(new NewsCategory(resultSet.getLong("id"),
                        resultSet.getString("name")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return newsCategories;
    }

    public static boolean editCategory(NewsCategory newsCategory){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE news_categories SET name = ? WHERE id = ?");
            statement.setString(1, newsCategory.getName());
            statement.setLong(2, newsCategory.getId());
            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static boolean deleteCategory(Long id){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM news_categories WHERE id = ?");
            statement.setLong(1,id);

            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static Language getLanguage(Long id){
        Language language = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM languages WHERE id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                language = new Language(resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return language;
    }

    public static ArrayList<Language> getLanguages(){
        ArrayList<Language> languages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM languages");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                languages.add(new Language(resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return languages;
    }

    public static Long addNews(News news){
        Long id = null;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news(id,post_date,category_id) "+
                    "VALUES (null, ?, ?)");
            statement.setTimestamp(1, news.getPostDate());
            statement.setLong(2, news.getCategoryId());
            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return id;
    }

    public static ArrayList<News> getNews(){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                news.add(new News(resultSet.getLong("id"),
                        resultSet.getTimestamp("post_date"),
                        resultSet.getLong("category_id")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static boolean editNews(News news){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE news SET category_id = ? WHERE id = ?");
            statement.setLong(1, news.getCategoryId());
            statement.setLong(2, news.getId());
            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static News getNewsById(Long id){

        News news = null;

        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news WHERE id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                news = new News(resultSet.getLong("id"),
                        resultSet.getTimestamp("post_date"),
                        resultSet.getLong("category_id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static Long getNewsId(){
        Long id = null;
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM news ORDER BY id DESC LIMIT 1");
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()){
                id = resultSet.getLong("id");
            }
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return id;
    }

    public static boolean addNewsContent(NewsContent newsContent){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news_contents " +
                    "VALUES (null, ?, ?, ?, ?)");
            statement.setString(1, newsContent.getText());
            statement.setString(2, newsContent.getContent());
            statement.setLong(3, newsContent.getNewsId());
            statement.setLong(4, newsContent.getLanguageId());

            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static void deleteNews(Long id){

    }

    public static boolean deleteNewsContent(Long id){
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement("DELETE FROM news_contents WHERE news_id = ?");
            st.setLong(1, id);
            a = st.executeUpdate();
            st.close();
            PreparedStatement statement = connection.prepareStatement("DELETE FROM news WHERE id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static NewsContent getNewsContent(Long id){
        NewsContent newsContent = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news_contents WHERE news_id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                newsContent = new NewsContent(resultSet.getLong("id"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getLong("news_id"),
                        resultSet.getLong("language_id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return newsContent;
    }

    public static ArrayList<NewsContent> getNewsContents(){
        ArrayList<NewsContent> newsContents = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news_contents");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                newsContents.add(new NewsContent(resultSet.getLong("id"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getLong("news_id"),
                        resultSet.getLong("language_id")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return newsContents;
    }

    public static boolean editNewsContent(NewsContent newsContent){
        int a = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE news_contents SET title = ?, content = ?, language_id = ? " +
                    "WHERE id = ?");
            statement.setString(1, newsContent.getText());
            statement.setString(2, newsContent.getContent());
            statement.setLong(3, newsContent.getLanguageId());
            statement.setLong(4, newsContent.getId());
            a = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return a>0;
    }

    public static void addComment(Comment comment){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO comment(id, comment, post_date, user_id, news_id) "+
                    "VALUES (null, ?, ?, ?, ?)");
            statement.setString(1, comment.getComment());
            statement.setTimestamp(2, comment.getPostDate());
            statement.setLong(3, comment.getUserId());
            statement.setLong(4, comment.getNewsId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Comment> getComments(){
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM comment ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                comments.add(new Comment(resultSet.getLong("id"),
                        resultSet.getString("comment"),
                        resultSet.getTimestamp("post_date"),
                        resultSet.getLong("user_id"),
                        resultSet.getLong("news_id")));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }

    public static void deleteComment(Long id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM comment WHERE id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}