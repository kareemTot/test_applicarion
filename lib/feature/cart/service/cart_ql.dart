String cartQl = '''
query Cart {
    cart(
        storeId: "alkhbaz"
        currencyCode: "EGP"
        userId: "5f5d15fd-39e2-4a8d-93d8-727208148bea"
        cartType: "cart"
        cartName: "DefaultCart"
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
        type
        items {
            inStockQuantity
            warehouseLocation
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
    }
}

''';
