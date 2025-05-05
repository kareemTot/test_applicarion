const String clearAllItem = '''
mutation ClearCart {
    clearCart(
        command: { 
            storeId: "alkhbaz",
            userId: "5f5d15fd-39e2-4a8d-93d8-727208148be" 
            cartId: "0b5a5463-5624-42e2-9678-afb75ed41e61"
            cartType: "cart"
            cartName: "DefaultCart"}
    ) {
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
        id
        items {
            inStockQuantity
            warehouseLocation
            isValid
            catalogId
            categoryId
            createdDate
            height
            id
            imageUrl
            isGift
            isReadOnly
            isReccuring
            languageCode
            length
            measureUnit
            name
            note
            objectType
            productId
            productType
            quantity
            requiredShipping
            shipmentMethodCode
            sku
            taxPercentRate
            taxType
            thumbnailImageUrl
            volumetricWeight
            weight
            weightUnit
            width
            fulfillmentCenterId
            fulfillmentCenterName
        }
    }
}
''';
