package com.lut.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lut.model.Stockout;
import com.lut.service.IStockoutService;
import com.lut.service.impl.StockoutServiceImpl;
import com.lut.util.JsonResult;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
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
public class StockoutController {
    private IStockoutService stockoutService;
    @GetMapping("/getOut")
    public JsonResult getOut() {
        List<Stockout> stockouts = stockoutService.getBaseMapper().selectList(null);
        if (stockouts == null || stockouts.size() == 0) {
            throw new RuntimeException("查询失败");
        }
        return new JsonResult(200, "success", stockouts);
    }/*

    private Integer productid;

    private Integer quantity;

    private String outgoingperson;

    private String notes;
    */
    @PostMapping("/addStockOut")
    public JsonResult addStockOut(int stockoutid,int productid,int quantity,String outgoingperson,String notes) {
        Stockout stockout1 = stockoutService.getBaseMapper().selectById(stockoutid);
        if (stockout1 != null) {
            stockoutService.getBaseMapper().deleteById(stockoutid);
        }
        Stockout stockout = new Stockout();
        stockout.setProductid(productid);
        stockout.setQuantity(quantity);
        System.out.println(outgoingperson);
        stockout.setOutgoingperson(outgoingperson);
        stockout.setNotes(notes);
        stockout.setStockouttime(LocalDateTime.now());
        int i = stockoutService.getBaseMapper().insert(stockout);
        if (i <= 0) {
            throw new RuntimeException("插入失败");
        }
        return new JsonResult(200,"success");
    }
    @PostMapping("/deleteStock")
    public JsonResult deleteStock(int id) {
        int i = stockoutService.getBaseMapper().deleteById(id);
        if (i <= 0) {throw new RuntimeException("删除失败");}
        return new JsonResult(200,"success");
    }
    @PostMapping("/findId")
    public JsonResult findId(int id) {
        List<Stockout> stockout = stockoutService.getBaseMapper().selectList(new QueryWrapper<Stockout>().eq("stockoutid", id));
        if (stockout == null) {throw new RuntimeException("没有当前id");}
        return new JsonResult(200,"success",stockout);
    }
}
