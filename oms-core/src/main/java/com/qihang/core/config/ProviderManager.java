//package com.qihang.core.config;
//
//
//import org.springframework.beans.factory.InitializingBean;
//import org.springframework.context.MessageSourceAware;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//
//public class ProviderManager implements AuthenticationManager, MessageSourceAware, InitializingBean {
//
//    // 外层认证入口核心代码
//    @Override
//    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//        Class<? extends Authentication> toTest = authentication.getClass();
//        AuthenticationException lastException = null;
//        AuthenticationException parentException = null;
//        Authentication result = null;
//        Authentication parentResult = null;
//        int currentPosition = 0;
//        int size = this.providers.size();
//        // 获取所有可用的认证机制（当然我们这里没有配置别的认证机制，只有一种默认的DaoAuthenticationProvider）
//        for (AuthenticationProvider provider : getProviders()) {
//            if (!provider.supports(toTest)) {
//                continue;
//            }
//            if (logger.isTraceEnabled()) {
//                logger.trace(LogMessage.format("Authenticating request with %s (%d/%d)",
//                        provider.getClass().getSimpleName(), ++currentPosition, size));
//            }
//            try {
//                // **** 这里才是真正的认证入口 ****
//                result = provider.authenticate(authentication);
//                if (result != null) {
//                    copyDetails(authentication, result);
//                    break;
//                }
//            }
//            catch (AccountStatusException | InternalAuthenticationServiceException ex) {
//                prepareException(ex, authentication);
//                // SEC-546: Avoid polling additional providers if auth failure is due to
//                // invalid account status
//                throw ex;
//            }
//            catch (AuthenticationException ex) {
//                lastException = ex;
//            }
//        }
//
//    }
//
//}
//
