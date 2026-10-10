package cn.xiaozhibang.evaluation.sdk.core;

import cn.xiaozhibang.evaluation.sdk.model.domain.CurrentUser;

/**
 * Stub TokenHelper for evaluation-sdk.
 * The real SDK generates JWT tokens for the evaluation system;
 * this stub returns a placeholder token so jzo2o-customer compiles
 * and runs without the proprietary JAR.
 */
public class TokenHelper {

    public static String generateTokenOfAdmin(String appId, String accessKeyId, String accessKeySecret, CurrentUser currentUser) {
        return "stub-admin-token";
    }

    public static String generateTokenOfUser(String appId, String accessKeyId, String accessKeySecret, CurrentUser currentUser) {
        return "stub-user-token";
    }
}
