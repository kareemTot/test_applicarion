const String removeItemFromCart = '''
mutation RemoveCartItem(\$id : String!) {
    removeCartItem(command: 
  {  
    storeId :"alkhbaz"
    userId :"5f5d15fd-39e2-4a8d-93d8-727208148bea"
    lineItemId : \$id
    cartId: "c16faf99-46d3-4ecb-9413-62e2d1b696f6"
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
