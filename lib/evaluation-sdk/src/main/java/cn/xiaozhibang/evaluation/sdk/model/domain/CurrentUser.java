package cn.xiaozhibang.evaluation.sdk.model.domain;

/**
 * Stub CurrentUser for evaluation-sdk.
 * The real SDK provides this POJO; this stub mirrors its public API
 * so jzo2o-customer compiles without the proprietary JAR.
 */
public class CurrentUser {

    private String id;
    private String nickName;
    private String userAvatar;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }
}
