export interface Location {
  street?: string
  city?: string
  postalCode?: string
  countryCode?: string
  lat?: number
  lng?: number
}

export interface Venue {
  id: string
  name: string
  secondaryName?: string
  location?: Location
}
