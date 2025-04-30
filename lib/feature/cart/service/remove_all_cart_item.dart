const String clearAllItem = '''
mutation ClearCart {
    clearCart(
        command: { 
            storeId: "alkhbaz",
            userId: "5f5d15fd-39e2-4a8d-93d8-727208148be" 
            cartId: "722d6065-8412-43cc-a356-010c025bb0c7"
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
