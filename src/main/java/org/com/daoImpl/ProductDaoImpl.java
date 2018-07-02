package org.com.daoImpl;

/**
 * Created by wangxue on 2018/6/28.
 */
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.com.dao.ProductDao;
import org.com.model.Product;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品信息-服务层实现
 *
 */
@Repository
@Transactional(readOnly = false)
public class ProductDaoImpl implements ProductDao {

    private HibernateTemplate template;

    @Autowired
    public ProductDaoImpl(SessionFactory sessionFactory) {

        this.template = new HibernateTemplate(sessionFactory);

    }

    @Override
    public void saveProduct(Product product) {

        template.save(product);

    }

}