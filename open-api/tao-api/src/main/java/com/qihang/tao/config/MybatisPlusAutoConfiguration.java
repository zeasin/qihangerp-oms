//package com.qihang.tao.config;
//
//import com.baomidou.mybatisplus.autoconfigure.SpringBootVFS;
//import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.util.ObjectUtils;
//import org.springframework.util.StringUtils;
//
//import javax.sql.DataSource;
//
//public class MybatisPlusAutoConfiguration {
//    @Bean
//    @ConditionalOnMissingBean  //spring容器中不存在SqlSessionFactory的bean对象才会运行该方法
//    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
//        MybatisSqlSessionFactoryBean factory = new MybatisSqlSessionFactoryBean();
//        factory.setDataSource(dataSource);
//        factory.setVfs(SpringBootVFS.class);
//        if (StringUtils.hasText(this.properties.getConfigLocation())) {
//            factory.setConfigLocation(this.resourceLoader.getResource(this.properties.getConfigLocation()));
//        }
//
//        this.applyConfiguration(factory);
//        if (this.properties.getConfigurationProperties() != null) {
//            factory.setConfigurationProperties(this.properties.getConfigurationProperties());
//        }
//
//        if (!ObjectUtils.isEmpty(this.interceptors)) {
//            factory.setPlugins(this.interceptors);
//        }
//
//        if (this.databaseIdProvider != null) {
//            factory.setDatabaseIdProvider(this.databaseIdProvider);
//        }
//
//        if (StringUtils.hasLength(this.properties.getTypeAliasesPackage())) {
//            factory.setTypeAliasesPackage(this.properties.getTypeAliasesPackage());
//        }
//
//        if (this.properties.getTypeAliasesSuperType() != null) {
//            factory.setTypeAliasesSuperType(this.properties.getTypeAliasesSuperType());
//        }
//
//        if (StringUtils.hasLength(this.properties.getTypeHandlersPackage())) {
//            factory.setTypeHandlersPackage(this.properties.getTypeHandlersPackage());
//        }
//
//        if (!ObjectUtils.isEmpty(this.typeHandlers)) {
//            factory.setTypeHandlers(this.typeHandlers);
//        }
//
//        //是否配置了MapperLocations路径
//        if (!ObjectUtils.isEmpty(this.properties.resolveMapperLocations())) {
//            factory.setMapperLocations(this.properties.resolveMapperLocations());
//        }
//
//        Objects.requireNonNull(factory);
//        this.getBeanThen(TransactionFactory.class, factory::setTransactionFactory);
//        Class<? extends LanguageDriver> defaultLanguageDriver = this.properties.getDefaultScriptingLanguageDriver();
//        if (!ObjectUtils.isEmpty(this.languageDrivers)) {
//            factory.setScriptingLanguageDrivers(this.languageDrivers);
//        }
//
//        Optional var10000 = Optional.ofNullable(defaultLanguageDriver);
//        Objects.requireNonNull(factory);
//        var10000.ifPresent(factory::setDefaultScriptingLanguageDriver);
//        this.applySqlSessionFactoryBeanCustomizers(factory);
//        GlobalConfig globalConfig = this.properties.getGlobalConfig();
//        Objects.requireNonNull(globalConfig);
//        this.getBeanThen(MetaObjectHandler.class, globalConfig::setMetaObjectHandler);
//        this.getBeansThen(IKeyGenerator.class, (i) -> {
//            globalConfig.getDbConfig().setKeyGenerators(i);
//        });
//        Objects.requireNonNull(globalConfig);
//        this.getBeanThen(ISqlInjector.class, globalConfig::setSqlInjector);
//        Objects.requireNonNull(globalConfig);
//        this.getBeanThen(IdentifierGenerator.class, globalConfig::setIdentifierGenerator);
//        factory.setGlobalConfig(globalConfig);
//        return factory.getObject();
//    }
//
//}
