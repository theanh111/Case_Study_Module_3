package model;

public class OrderDetail {
    private Deck deckId;
    private Order orderId;
    private int quantityOrdered;

    public OrderDetail() {
    }

    public OrderDetail(Deck deckId, Order orderId, int quantityOrdered) {
        this.deckId = deckId;
        this.orderId = orderId;
        this.quantityOrdered = quantityOrdered;
    }

    public Deck getDeckId() {
        return deckId;
    }

    public void setDeckId(Deck deckId) {
        this.deckId = deckId;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    public int getQuantityOrdered() {
        return quantityOrdered;
    }

    public void setQuantityOrdered(int quantityOrdered) {
        this.quantityOrdered = quantityOrdered;
    }
}
