package com.example.Test;

import com.example.bean.Cart;
import com.example.bean.CartItem;
import org.junit.Test;

import java.math.BigDecimal;

public class CartTest {
    Cart cart = new Cart();
    @Test
    public void addItem(){
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        System.out.println(cart);
    }
    @Test
    public void deleteItem(){
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.deleteItem(2);
        System.out.println(cart);

    }
    @Test
    public void clear(){
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        cart.clear();
        System.out.println(cart);
    }
    @Test
    public void updateItem(){
        cart.addItem(new CartItem(1, "母猪产后护理", 1, new BigDecimal(90), new BigDecimal(90)));
        cart.addItem(new CartItem(2, "如何学好java", 1, new BigDecimal(90), new BigDecimal(60)));
        System.out.println(cart);
        cart.updateCount(2, 2);
        System.out.println(cart);
    }
}
