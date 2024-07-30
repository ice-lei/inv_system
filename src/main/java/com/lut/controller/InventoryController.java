package com.lut.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lut.model.Inventory;
import com.lut.service.IInventoryService;
import com.lut.util.JsonResult;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
@AllArgsConstructor
@RestController
public class InventoryController {
    private IInventoryService inventoryService;
    @GetMapping("/getInventory")
    public JsonResult getInventory() {
        List<Inventory> inventories = inventoryService.getBaseMapper().selectList(null);
        if (inventories.isEmpty()) {
            throw new RuntimeException("获取失败");
        }
        return new JsonResult(200, "success", inventories);
    }
    @PostMapping("/selectByName")
    public JsonResult selectByName(String name) {
        List<Inventory> inventories = inventoryService.getBaseMapper().selectList(new QueryWrapper<Inventory>().like("productname", name));
        if (inventories.isEmpty()) {throw new RuntimeException("查无此物");}
        return new JsonResult(200, "success",inventories);
    }
}
