package com.lut.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lut.model.Stockin;
import com.lut.service.IStockinService;
import com.lut.util.JsonResult;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
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
public class StockinController {
    private IStockinService stockinService;
    @GetMapping("/getIn")
    public JsonResult getStockin() {
        List<Stockin> stockins = stockinService.getBaseMapper().selectList(null);
        if (stockins == null || stockins.size() == 0) {throw new RuntimeException("获取失败");}
        return new JsonResult(200,"success",stockins);
    }
    @PostMapping("/addStockIn")
    public JsonResult addStockin(String notes,int productid,String purchaser,
                                 int quantity,String remarks,int stockInid,String supplier) {
        stockinService.getBaseMapper().deleteById(stockInid);
        Stockin stockin = new Stockin();
        stockin.setNotes(notes);
        stockin.setProductid(productid);
        stockin.setPurchaser(purchaser);
        stockin.setQuantity(quantity);
        stockin.setRemarks(remarks);
        stockin.setStockInid(stockInid);
        stockin.setSupplier(supplier);
        stockin.setStockIntime(LocalDateTime.now());
        int i = stockinService.getBaseMapper().insert(stockin);
        if (i<=0){
            throw new RuntimeException("插入失败");
        }
        return new JsonResult(200,"success");
    }
    @GetMapping("/getInmsg")
    public JsonResult getById(int id) {
        List<Stockin> inid = stockinService.getBaseMapper().selectList(new QueryWrapper<Stockin>().eq("stockInid", id));
        if (inid.size()==0)
            throw new RuntimeException("获取失败");
        return new JsonResult(200,"success",inid);
    }
}
