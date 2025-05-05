const String updateOrderDynamicPropertiesQL = '''
mutation UpdateOrderDynamicProperties(\$id :String!) {
    updateOrderDynamicProperties(
        command: {
            dynamicProperties: {
                name: "orderSource"
                value: "f1a20fb3-40ff-4e47-a141-c5996172b04d"
            }
            orderId: \$id
        }
    ) {
        id
        operationType
        parentOperationId
        number
        isApproved
        status
        comment
        outerId
        isCancelled
        cancelledDate
        cancelReason
        objectType
        customerId
        customerName
        channelId
        storeId
        storeName
        organizationId
        organizationName
        employeeId
        employeeName
        shoppingCartId
        isPrototype
        subscriptionNumber
        subscriptionId
        purchaseOrderNumber
        feeWithTax
        feeTotal
        feeTotalWithTax
        taxType
        taxPercentRate
        languageCode
        createdDate
        createdBy
        modifiedDate
        modifiedBy
        coupons
        items {
            id
            productType
            name
            comment
            imageUrl
            isGift
            shippingMethodCode
            fulfillmentLocationCode
            fulfillmentCenterId
            fulfillmentCenterName
            outerId
            weightUnit
            weight
            measureUnit
            height
            length
            width
            isCancelled
            cancelledDate
            cancelReason
            objectType
            status
            categoryId
            catalogId
            sku
            priceId
            taxType
            taxPercentRate
            reserveQuantity
            quantity
            productId
        }
    }
}
 ''';
