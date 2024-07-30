package com.lut.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
@TableName("products")
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "productid", type = IdType.AUTO)
    private Integer productid;

    private String producttype;

    private String productname;

    private String productspecification;

    private String origin;

    private String brand;

    private String manufacturer;

    private Integer supplierid;


}
