const String removeItemFromCart = '''
mutation RemoveCartItem(\$id : String!) {
    removeCartItem(command: 
  {  
    storeId :"alkhbaz"
    userId :"5f5d15fd-39e2-4a8d-93d8-727208148bea"
    lineItemId : \$id
    cartId: "1364befa-b189-4820-87fa-27378a6ec09d"
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
