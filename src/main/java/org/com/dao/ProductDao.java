package org.com.dao;

/**
 * Created by wangxue on 2018/6/28.
 */
import org.com.model.Product;

/**
 * 商品操作-持久层接口
 *
 */
public interface ProductDao {

    void saveProduct(Product product);

}