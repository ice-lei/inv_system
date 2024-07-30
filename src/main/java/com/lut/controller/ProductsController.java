package com.lut.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.lut.model.Products;
import com.lut.service.IProductsService;
import com.lut.util.JsonResult;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2024-07-27
 */
@RestController
@AllArgsConstructor
public class ProductsController {
    private IProductsService productsService;
    @GetMapping("/getProducts")
    public JsonResult getProducts() {
        List<Products> products = productsService.getBaseMapper().selectList(null);
        if (products.isEmpty()) {
            throw new RuntimeException("获取失败");
        }
        return new JsonResult(200,"success",products);

    }
    @PostMapping("deleteProducts")
    public JsonResult deleteProducts(int id) {
        productsService.getBaseMapper().deleteById(id);
        return new JsonResult(200,"success");
    }
    @PostMapping("/addProduct")
    public JsonResult addProduct(String brand,String manufacturer,String origin,
                                 int productid,String productname,String productspecification,
                                 String producttype,int supplierid) {
        if (productid == 0 ){
            Products products1 = new Products();
            products1.setBrand(brand);
            products1.setManufacturer(manufacturer);
            products1.setOrigin(origin);
            products1.setProductname(productname);
            products1.setProductspecification(productspecification);
            products1.setProducttype(producttype);
            products1.setSupplierid(supplierid);
            int i = productsService.getBaseMapper().insert(products1);
            if (i != 1) {throw new RuntimeException("添加失败");}
            return new JsonResult(200,"success");
        }else{
            int i = productsService.getBaseMapper().update(new UpdateWrapper<Products>().eq("productid", productid).set("productname", productname)
                    .set("productspecification", productspecification)
                    .set("brand", brand).set("manufacturer", manufacturer).set("origin", origin).set("producttype", producttype).set("supplierid", supplierid));
            if (i==0)
                throw new RuntimeException("更改失败");

        }
        return new JsonResult(200,"success");
    }
    @PostMapping("/selectByPname")
    public JsonResult selectByPname(String name) {
        List<Products> products = productsService.getBaseMapper().selectList(new QueryWrapper<Products>().like("productname", name));
        if (products.isEmpty()) {throw new RuntimeException("查询失败");}
        return new JsonResult(200,"success",products);
    }
}
