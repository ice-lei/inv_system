package com.lut.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2024-07-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("inventory")
public class Inventory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "inventoryid", type = IdType.AUTO)
    private Integer inventoryid;

    private Integer productid;

    private Integer quantity;

    private String supplier;

    private String purchaser;

    private String productname;

    private String productspecification;

    private String notes;

    private LocalDateTime lastupdate;


}
