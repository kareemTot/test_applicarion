String cartQl = '''
query Carts {
    carts(storeId: "alkhbaz", userId: "5f5d15fd-39e2-4a8d-93d8-727208148bea") {
        totalCount
        items {
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
            type
        }
    }
}

''';
