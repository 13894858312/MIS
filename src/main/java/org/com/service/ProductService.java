package org.com.service;

/**
 * Created by wangxue on 2018/6/28.
 */
import org.com.model.Product;

/**
 * 商品操作-服务层接口
 *
 */
public interface ProductService {

    void saveProduct(Product product);
}