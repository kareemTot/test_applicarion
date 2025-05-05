const String removeItemFromCart = '''
mutation RemoveCartItem(\$id : String!) {
    removeCartItem(command: 
  {  
    storeId :"alkhbaz"
    userId :"5f5d15fd-39e2-4a8d-93d8-727208148bea"
    lineItemId : \$id
    cartId: "0b5a5463-5624-42e2-9678-afb75ed41e61"
    cartType: "cart"
    cartName: "DefaultCart"
    currencyCode: "EGP"
  }
    
    ) {
        id
        name
        status
        storeId
        fulfillmentCenterId
        channelId
        hasPhysicalProducts
        isAnonymous
        customerId
        customerName
        organizationId
        isRecuring
        comment
        purchaseOrderNumber
        volumetricWeight
        weightUnit
        weight
        taxPercentRate
        taxType
        itemsCount
        itemsQuantity
        isValid
        type
    }
}
 ''';
