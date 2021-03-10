//
//  NewsPage.swift
//  NewsService
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
 
public struct HomeScreenResponse: Decodable {
    public let city_name: String
    public let city_id: Int
    public let instudio: String
    public let product_tags: [Product_tag]
    public let campaigns: [Campaign]
    public let categories: Categories
    public let onepass_pre: OnePass
    public let upcoming_classes: UpcomingClass
    public let fitness_centres: FitnessCentre
    public let section_orders: [String]
    
    enum CodingKeys: String, CodingKey {
        case city_name = "city_name"
        case city_id = "city_id"
        case instudio = "instudio"
        case product_tags = "product_tags"
        case campaigns = "campaigns"
        case categories = "categories"
        case onepass_pre = "onepass_pre"
        case upcoming_classes = "upcoming_classes"
        case fitness_centres = "fitness_centres"
        case section_orders = "section_orders"
    }
    
    public struct InnerCampaign: Decodable {
          public let image: String
          public let title: String
          public let bg_color: String
          public let text_color: String
          public let url: String
    
          enum CodingKeys: String, CodingKey {
              case image = "image"
              case title = "title"
              case bg_color = "bg_color"
              case text_color = "text_color"
              case url = "url"
          }
      }//InnerCampaign
    
    public struct Product_tag: Decodable {
        public let image: String
        public let title: String
        public let text: String
        public let link: String
  
        enum CodingKeys: String, CodingKey {
            case image = "image"
            case title = "title"
            case text = "text"
            case link = "link"
        }
    }//Product_tag
    
    public struct Campaign: Decodable {
          public let image: String
          public let link: String
          public let title: String
          public let height: Int
          public let width: Int
          public let ratio: Double
          public let order: Int
    
          enum CodingKeys: String, CodingKey {
              case image = "image"
              case link = "link"
              case title = "title"
              case height = "height"
              case width = "width"
              case ratio = "ratio"
              case order = "order"
          }
      }//Campaign
    
    public struct Categories: Decodable {
        public let title: String
        public let text: String
        public let max_category: Int
        public let all_category_title: String
        public let categorytags: [CategoryTag]?
        public let campaign: InnerCampaign?
        
        public struct CategoryTag: Decodable {
            public let name: String
            public let slug: String
            public let _id: Int
            public let image: String

            enum CodingKeys: String, CodingKey {
                case name = "name"
                case slug = "slug"
                case _id = "_id"
                case image = "image"
            }
        }
          
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case text = "text"
            case max_category = "max_category"
            case all_category_title = "all_category_title"
            case categorytags = "categorytags"
            case campaign = "campaign"
        }
    }//Categories
    
    public struct OnePass: Decodable {
        public let header_img: String
        public let button_text: String
        public let passes: Pass?
        public let campaign: InnerCampaign?
        
        public struct Pass: Decodable {
            public let image: String
            public let header1: String
            public let header1_color: String
            public let header2: String
            public let subtitle: String
            public let header2_color: String
            public let subheader: String
            public let desc_header: String
            public let onepass_type: String
            public let description: String
            
            enum CodingKeys: String, CodingKey {
                case image = "image"
                case header1 = "header1"
                case header1_color = "header1_color"
                case header2 = "header2"
                case subtitle = "subtitle"
                case header2_color = "header2_color"
                case subheader = "subheader"
                case desc_header = "desc_header"
                case onepass_type = "onepass_type"
                case description = "description"
            }
        }
          
        enum CodingKeys: String, CodingKey {
            case header_img = "header_img"
            case button_text = "button_text"
            case passes = "passes"
            case campaign = "campaign"
        }
    }//OnePass
    
    public struct UpcomingClass: Decodable {
        public let title : String?
        public let description : String?
        public let button_text : String?
        public let campaign :  InnerCampaign?
        public let session_type : String?
        public let data : [UpcomingClassData]
         
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case description = "description"
            case button_text = "button_text"
            case campaign = "campaign"
            case session_type = "session_type"
            case data = "data"
        }
        
        public struct UpcomingClassData: Decodable
        {
            public let average_rating : Double?
            public let name : String
            public let slug : String
            public let vendor_slug : String
            public let vendor_name : String
            public let coverimage : String
            public let overlayimage : String
            public let total_slots : String
            public let next_slot : String
            public let total_rating_count : Int?
            public let location : String
            public let address : Address?
            public let special_price : Int?
            public let campaign_text : String
            public let commercial : String
            public let service_type : String
            public let _id : Int?
            public let booking_points : Int?
            public let session_time : Int?
            public let overlayimage_v2 : OverlayImageV2?
            public let pps_oneliner : String
            public let flags : Flag?
            public let overlay_details : [OverlayDetails]
            public let tag_image : String
            
            enum CodingKeys: String, CodingKey {
                case average_rating = "average_rating"
                case name = "name"
                case slug = "slug"
                case vendor_slug = "vendor_slug"
                case vendor_name = "vendor_name"
                case coverimage = "coverimage"
                case overlayimage = "overlayimage"
                case total_slots = "total_slots"
                case next_slot = "next_slot"
                case total_rating_count = "total_rating_count"
                case location = "location"
                case address = "address"
                case special_price = "special_price"
                case campaign_text = "campaign_text"
                case commercial = "commercial"
                case service_type = "service_type"
                case _id = "id"
                case booking_points = "booking_points"
                case session_time = "session_time"
                case overlayimage_v2 = "overlayimage_v2"
                case pps_oneliner = "pps_oneliner"
                case flags = "flags"
                case overlay_details = "overlay_details"
                case tag_image = "tag_image"
            }
              
            public struct Address: Decodable {
                public let pincode : Int?
                public let location : String
                public let line3 : String
                public let landmark : String
                public let line2 : String
                public let line1 : String

                enum CodingKeys: String, CodingKey {
                    case pincode = "pincode"
                    case location = "location"
                    case line3 = "line3"
                    case landmark = "landmark"
                    case line2 = "line2"
                    case line1 = "line1"
                }
            }

            public struct OverlayImageV2: Decodable {
                public let icon : String
                public let text : String

                enum CodingKeys: String, CodingKey {
                    case icon = "icon"
                    case text = "text"
                }
            }
            
            public struct Flag: Decodable {
                public let onepass_max_booking_count : Int?

                enum CodingKeys: String, CodingKey {
                    case onepass_max_booking_count = "onepass_max_booking_count"
                }
            }
            
            public struct OverlayDetails: Decodable {
                public let icon : String
                public let text : String

                enum CodingKeys: String, CodingKey {
                    case icon = "icon"
                    case text = "text"
                }
            }

        }//UpcomingClassData
         
    }//UpcomingClass
    
    public struct FitnessCentre : Decodable{
    public let title : String
    public let description : String
    public let button_text : String
    public let data : [FitnessCentreData]
        
    public struct FitnessCentreData: Decodable {
               public let average_rating : Double?
               public let coverimage : String?
               public let location : String?
               public let slug : String?
               public let _id : Int?
               public let categorytags : [String]?
               public let category : String?
               public let total_rating_count : Int?
               public let flags : FitnessCentreFlag
               public let commercial : String?
               public let featured : Bool
               public let offering_images : [OfferingImage]
               public let trial_header : String?
               public let membership_header : String?
               public let membership_icon : String?
               public let membership_offer_default : Bool
               public let membership_offer : String?
               public let type : String?
               public let address : String?
               public let title : String?
               public let subcategories : [String]?
               public let tag_image : String?
    
               public struct FitnessCentreFlag: Decodable {
                   public let trial : String?
                   public let membership : String?
                   public let top_selling : Bool
                   public let newly_launched : Bool
                   public let opening_soon : Bool
                   public let coming_on_onepass : Bool
                   public let state : String?
                   public let featured : Bool
                   public let april5 : Bool
                   public let not_available_on_onepass : Bool
                   public let forced_on_onepass : Bool
                   public let lite_classpass_available : Bool
                   public let covid_state : String?
                   public let covid_state_id : Int?
                   public let covid_state_immediately : Bool
                   public let monsoon_flash_discount : String?
                   public let monsoon_flash_discount_per : Int?
                   public let monsoon_flash_discount_disabled : Bool
                   public let hyper_local_list :[String]?

                   enum CodingKeys: String, CodingKey {
                       case trial = "trial"
                       case membership = "membership"
                       case top_selling = "top_selling"
                       case newly_launched = "newly_launched"
                       case opening_soon = "opening_soon"
                       case coming_on_onepass = "coming_on_onepass"
                       case state = "state"
                       case featured = "featured"
                       case april5 = "april5"
                       case not_available_on_onepass = "not_available_on_onepass"
                       case forced_on_onepass = "forced_on_onepass"
                       case lite_classpass_available = "lite_classpass_available"
                       case covid_state = "covid_state"
                       case covid_state_id = "covid_state_id"
                       case covid_state_immediately = "covid_state_immediately"
                       case monsoon_flash_discount = "monsoon_flash_discount"
                       case monsoon_flash_discount_per = "monsoon_flash_discount_per"
                       case monsoon_flash_discount_disabled = "monsoon_flash_discount_disabled"
                       case hyper_local_list = "hyper_local_list"
                   }
               }
       
               public struct OfferingImage: Decodable {
                   public let image : String
                   public let height : Int
                   public let width : Int

                   enum CodingKeys: String, CodingKey {
                       case image = "image"
                       case height = "height"
                       case width = "width"
                   }
               }
                 
               enum CodingKeys: String, CodingKey {
                   case average_rating = "average_rating"
                   case coverimage = "coverimage"
                   case location = "location"
                   case slug = "slug"
                   case _id = "id"
                   case categorytags = "categorytags"
                   case category = "category"
                   case total_rating_count = "total_rating_count"
                   case flags = "flags"
                   case commercial = "commercial"
                   case featured = "featured"
                   case offering_images = "offering_images"
                   case trial_header = "trial_header"
                   case membership_header = "membership_header"
                   case membership_icon = "membership_icon"
                   case membership_offer_default = "membership_offer_default"
                   case membership_offer = "membership_offer"
                   case type = "type"
                   case address = "address"
                   case title = "title"
                   case subcategories = "subcategories"
                   case tag_image = "tag_image"
               }
           }
        
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case description = "description"
            case button_text = "button_text"
            case data = "data"
        }
    }//FitnessCentre
 
}//HomeScreenResponse


/*
extension UpcomingClassData: Decodable
{
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.average_rating = try container.decodeIfPresent(Double.self, forKey: .average_rating) ?? 0.0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.vendor_slug = try container.decodeIfPresent(String.self, forKey: .vendor_slug) ?? ""
        self.vendor_name = try container.decodeIfPresent(String.self, forKey: .vendor_name) ?? ""
        self.coverimage = try container.decodeIfPresent(String.self, forKey: .coverimage) ?? ""
        self.overlayimage = try container.decodeIfPresent(String.self, forKey: .overlayimage) ?? ""
        self.total_slots = try container.decodeIfPresent(String.self, forKey: .total_slots) ?? ""
        self.next_slot = try container.decodeIfPresent(String.self, forKey: .next_slot) ?? ""
        self.total_rating_count = try container.decodeIfPresent(Int.self, forKey: .total_rating_count) ?? 0
        self.location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
        self.address = try container.decodeIfPresent(Address.self, forKey: .address) ?? nil
        self.special_price = try container.decodeIfPresent(Int.self, forKey: .special_price) ?? 0
        self.campaign_text = try container.decodeIfPresent(String.self, forKey: .campaign_text) ?? ""
        self.commercial = try container.decodeIfPresent(String.self, forKey: .commercial) ?? ""
        self.service_type = try container.decodeIfPresent(String.self, forKey: .service_type) ?? ""
        self._id = try container.decodeIfPresent(Int.self, forKey: ._id) ?? 0
        self.booking_points = try container.decodeIfPresent(Int.self, forKey: .booking_points) ?? 0
        self.session_time = try container.decodeIfPresent(Int.self, forKey: .session_time) ?? 0
        self.overlayimage_v2 = try container.decodeIfPresent(OverlayImageV2.self, forKey: .overlayimage_v2) ?? nil
        self.pps_oneliner = try container.decodeIfPresent(String.self, forKey: .pps_oneliner) ?? ""
        self.flags = try container.decodeIfPresent(Flag.self, forKey: .flags) ?? nil
        self.overlay_details = try container.decodeIfPresent([OverlayDetails].self, forKey: .overlay_details) ?? []
        self.tag_image = try container.decodeIfPresent(String.self, forKey: .tag_image) ?? ""
    }
    
}//extension UpcomingClassData
 */


