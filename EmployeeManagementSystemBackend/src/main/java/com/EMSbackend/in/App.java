package com.EMSbackend.in;

import java.util.Properties;

import javax.persistence.Basic;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;





@Configuration
@ComponentScan("com.EMSbackend.in.entities")
@EnableTransactionManagement
public class App 
{
   private static final String Driver = "com.mysql.cj.jdbc.Driver";
   private static final String DB_URL ="jdbc:mysql://localhost:3306/employeemanagementsystem";
   private static final String USERNAME ="root";
   private static final String PASSWORD ="mypassword";
   
   @Bean("basicDataSource")
   public DataSource getDataSource() {
	   
	   BasicDataSource basicDataSource=new BasicDataSource();
	   
	   basicDataSource.setDriverClassName(Driver);
	   basicDataSource.setUrl(DB_URL);
	   basicDataSource.setUsername(USERNAME);
	   basicDataSource.setPassword(PASSWORD);
	return basicDataSource;
	   
   }
   @Bean
   public SessionFactory getSessionFactory(DataSource d) {
	   
	 LocalSessionFactoryBuilder localSessionFactoryBuilder = new LocalSessionFactoryBuilder(d) ;
	 localSessionFactoryBuilder.scanPackages("com.EMSbackend.in.entities");
	 localSessionFactoryBuilder.addProperties(getHibernateProperties());	 
	return localSessionFactoryBuilder.buildSessionFactory();
	   
   }
   
   public Properties getHibernateProperties() {
	   
	   Properties pro = new Properties();
	   
	   pro.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
	   pro.put("hibernate.hbm2ddl.auto", "update");
	   pro.put("show_sql", "true");
	return pro;
	
   }
   @Bean
   public HibernateTransactionManager getTransactionManager(SessionFactory sf) {
	   
	   HibernateTransactionManager htb = new HibernateTransactionManager(sf);
	   
	return htb;
	   
   }
}
