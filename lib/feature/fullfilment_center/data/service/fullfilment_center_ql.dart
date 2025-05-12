const String getFullfilmentCenterQuery = ''' 
query FulfillmentCenters {
    fulfillmentCenters(storeId: "alkhbaz", fulfillmentCenterIds: null) {
        totalCount
        items {
            id
            name
            description
            outerId
            geoLocation
            shortDescription
            address {
                id
                key
                city
                countryCode
                countryName
                email
                firstName
                middleName
                lastName
                line1
                line2
                name
                organization
                phone
                regionId
                regionName
                zip
                outerId
                addressType
            }
            nearest {
                id
                name
                description
                outerId
                geoLocation
                shortDescription
                address {
                    id
                    key
                    city
                    countryCode
                    countryName
                    email
                    firstName
                    middleName
                    lastName
                    line1
                    line2
                    name
                    organization
                    phone
                 
                    regionId
                    regionName
                    zip
                    outerId
                    addressType
                }
                nearest {
                    id
                    name
                    description
                    outerId
                    geoLocation
                    shortDescription
                }
            }
        }
    }
}

''';
