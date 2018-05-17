package com.ssm.entity;

public class CommentUser {
    private User user;
    private Comment comment;
    private Topic topic;
    private Activity activity;
    private Jindian jindian;

    public Jindian getJindian() {
        return jindian;
    }

    public void setJindian(Jindian jindian) {
        this.jindian = jindian;
    }

    public CommentUser() {
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public CommentUser(User user, Comment comment) {
        this.user = user;
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }
}
