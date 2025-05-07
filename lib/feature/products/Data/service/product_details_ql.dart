const String productDetailsQl = '''
query Product(\$id:String!) {
    product(id: \$id, storeId: "alkhbaz") {
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
        price {
            discountPercent
            currency
            validFrom
            startDate
            validUntil
            endDate
            pricelistId
            minQuantity
        }
        descriptions {
            id
            reviewType
            content
            languageCode
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
        prices {
            discountPercent
            currency
            validFrom
            startDate
            validUntil
            endDate
            pricelistId
            minQuantity
        }
        variations {
            id
            name
            code
            productType
            minQuantity
            maxQuantity
            slug
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
            availabilityData {
                availableQuantity
                isBuyable
                isAvailable
                isInStock
                isActive
                isTrackInventory
            }
            prices {
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
            images {
                id
                name
                group
                url
                relativeUrl
                sortOrder
                cultureName
            }
        }
        description {
            id
            reviewType
            content
            languageCode
        }
        minVariationPrice {
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
            tierPrices {
                quantity
                price {
                    amount
                    decimalDigits
                    formattedAmount
                    formattedAmountWithoutCurrency
                    formattedAmountWithoutPoint
                    formattedAmountWithoutPointAndCurrency
                }
                priceWithTax {
                    amount
                    decimalDigits
                    formattedAmount
                    formattedAmountWithoutCurrency
                    formattedAmountWithoutPoint
                    formattedAmountWithoutPointAndCurrency
                }
            }
            discounts {
                coupon
                description
                promotionId
                amount
                amountWithTax
            }
        }
    }
}

 ''';
