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
            category {
                name
                id
                level
                parent {
                    name
                    id
                }
            }
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
            variations {
                id
                name
                code
                productType
                minQuantity
                maxQuantity
                slug
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
                images {
                    id
                    name
                    group
                    url
                    relativeUrl
                    sortOrder
                    cultureName
                }
                price {
                    discountPercent
                    currency
                    validFrom
                    startDate
                    validUntil
                    endDate
                    pricelistId
                    minQuantity
                    list {
                        amount
                        decimalDigits
                        formattedAmount
                        formattedAmountWithoutCurrency
                        formattedAmountWithoutPoint
                        formattedAmountWithoutPointAndCurrency
                    }
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
