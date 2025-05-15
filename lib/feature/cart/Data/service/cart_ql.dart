String cartQl = '''
query Cart {
    cart(
        storeId: "alkhbaz"
        userId: "33c62fb7-7904-4872-ad08-34062f343178"
        cartType: "cart"
        cartName: "DefaultCart"
        currencyCode: "EGP"
    ) {
        id
        name
        storeId
        hasPhysicalProducts
        isAnonymous
        customerId
        customerName
        isRecuring
        taxPercentRate
        itemsCount
        itemsQuantity
        type
        items {
            inStockQuantity
            warehouseLocation
            catalogId
            categoryId
            createdDate
            id
            imageUrl
            isGift
            isReadOnly
            isReccuring
            measureUnit
            name
            objectType
            productId
            productType
            quantity
            requiredShipping
            shipmentMethodCode
            sku
            taxPercentRate
            taxType
            weightUnit
            fulfillmentCenterId
            fulfillmentCenterName
            extendedPrice {
                amount
                decimalDigits
                formattedAmount
                formattedAmountWithoutCurrency
                formattedAmountWithoutPoint
                formattedAmountWithoutPointAndCurrency
            }
        }
        total {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
        }
        shipments {
            id
            shipmentMethodCode
            taxPercentRate
            deliveryAddress {
                id
                key
                city
                countryCode
                countryName
                firstName
                lastName
                line1
                name
                regionId
                regionName
                outerId
                addressType
            }
            price {
                amount
                decimalDigits
                formattedAmount
                formattedAmountWithoutCurrency
                formattedAmountWithoutPoint
                formattedAmountWithoutPointAndCurrency
            }
        }
        subTotal {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
        }
        taxTotal {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
        }
        taxDetails {
            name
            price {
                amount
                decimalDigits
                formattedAmount
                formattedAmountWithoutCurrency
                formattedAmountWithoutPoint
                formattedAmountWithoutPointAndCurrency
            }
            amount {
                amount
                decimalDigits
                formattedAmount
                formattedAmountWithoutCurrency
                formattedAmountWithoutPoint
                formattedAmountWithoutPointAndCurrency
            }
        }
        shippingPrice {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
        }
        shippingTotal {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
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
''';
