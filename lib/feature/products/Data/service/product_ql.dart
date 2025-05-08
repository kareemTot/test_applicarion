const String productQl = '''
query Products(\$first: Int, \$after: String , \$filter: String) {
    products(storeId: "alkhbaz" ,first: \$first, after: \$after , filter: \$filter, cultureName: "en-Us"
        currencyCode: "USD") {
       items {
            id
            code
            catalogId
            productType
            minQuantity
            maxQuantity
            outline
            slug
            name
            imgSrc
            outerId
            brandName
            hasVariations
            inWishlist
               images {
                id
                name
                group
                url
                relativeUrl
                sortOrder
                cultureName
            }
             availabilityData {
                availableQuantity
                isBuyable
                isAvailable
                isInStock
                isActive
                isTrackInventory
                inventories {
                    inStockQuantity
                    reservedQuantity
                    fulfillmentCenterId
                    fulfillmentCenterName
                    allowPreorder
                    allowBackorder
                    preorderAvailabilityDate
                    backorderAvailabilityDate
                }
            }
        }
        totalCount
        pageInfo {
            hasNextPage
            endCursor
        }
    }
  
}

''';
