package com.lut.model;

import com.baomidou.mybatisplus.annotation.TableField;
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
@TableName("stockin")
public class Stockin implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "stockInid", type = IdType.AUTO)
    private Integer stockInid;
    @TableField(value = "productid")
    private Integer productid;

    private Integer quantity;

    private String supplier;

    private String notes;
    @TableField(value = "stockIntime")
    private LocalDateTime stockIntime;

    private String purchaser;

    private String remarks;


}
