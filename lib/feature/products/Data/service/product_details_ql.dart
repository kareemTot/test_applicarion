const String productDetailsQl = '''
query Product(\$id: String!) {
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
        }
    }
}

 ''';
