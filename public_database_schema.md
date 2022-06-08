classDiagram
direction BT
class auth_group {
   varchar(150) name
   integer id
}
class auth_group_permissions {
   integer group_id
   integer permission_id
   bigint id
}
class auth_permission {
   varchar(255) name
   integer content_type_id
   varchar(100) codename
   integer id
}
class core_degree {
   varchar(100) level
   varchar(100) domain
   varchar(100) institution
   integer rank
   bigint user_id
   bigint id
}
class core_emaildomain {
   varchar(100) domain
   varchar(10) status
   timestamp with time zone datetime_add
   bigint id
}
class core_expertise {
   varchar(100) name
   integer rank
   bigint user_id
   bigint id
}
class core_expertisekeyword {
   varchar(100) name
   integer rank
   bigint user_id
   bigint id
}
class core_user {
   varchar(128) password
   timestamp with time zone last_login
   boolean is_superuser
   varchar(150) username
   varchar(254) email
   boolean is_staff
   boolean is_active
   timestamp with time zone date_joined
   boolean is_demo
   varchar(100) first_name
   varchar(100) last_name
   text title
   text bio
   boolean comment_anonymously
   boolean show_online_presence
   boolean show_my_profile
   integer birth_year
   varchar(50) gender
   varchar(100) nationality
   varchar(100) residence
   varchar(50) race
   varchar(50) political_affiliation
   varchar(50) religion
   varchar(50) degree_of_political_engagement
   varchar(50) moral_philosophy
   varchar(500) website
   varchar(500) linkedin
   varchar(500) youtube
   varchar(500) google_scholar
   varchar(500) orcid
   varchar(500) researchgate
   varchar(500) twitter
   varchar(100) avatar
   bigint id
}
class core_user_groups {
   bigint user_id
   integer group_id
   bigint id
}
class core_user_user_permissions {
   bigint user_id
   integer permission_id
   bigint id
}
class core_verifiableemail {
   varchar(100) email
   boolean is_verified
   timestamp with time zone last_verification_email_ts
   varchar(1000) token
   integer rank
   bigint domain_fk_id
   bigint user_id
   bigint id
}
class default_cache_table {
   text value
   timestamp with time zone expires
   varchar(255) cache_key
}
class django_admin_log {
   timestamp with time zone action_time
   text object_id
   varchar(200) object_repr
   smallint action_flag
   text change_message
   integer content_type_id
   bigint user_id
   integer id
}
class django_content_type {
   varchar(100) app_label
   varchar(100) model
   integer id
}
class django_migrations {
   varchar(255) app
   varchar(255) name
   timestamp with time zone applied
   bigint id
}
class django_session {
   text session_data
   timestamp with time zone expire_date
   varchar(40) session_key
}
class oauth2_provider_accesstoken {
   varchar(255) token
   timestamp with time zone expires
   text scope
   bigint application_id
   bigint user_id
   timestamp with time zone created
   timestamp with time zone updated
   bigint source_refresh_token_id
   bigint id_token_id
   bigint id
}
class oauth2_provider_application {
   varchar(100) client_id
   text redirect_uris
   varchar(32) client_type
   varchar(32) authorization_grant_type
   varchar(255) client_secret
   varchar(255) name
   bigint user_id
   boolean skip_authorization
   timestamp with time zone created
   timestamp with time zone updated
   varchar(5) algorithm
   bigint id
}
class oauth2_provider_grant {
   varchar(255) code
   timestamp with time zone expires
   text redirect_uri
   text scope
   bigint application_id
   bigint user_id
   timestamp with time zone created
   timestamp with time zone updated
   varchar(128) code_challenge
   varchar(10) code_challenge_method
   varchar(255) nonce
   text claims
   bigint id
}
class oauth2_provider_idtoken {
   uuid jti
   timestamp with time zone expires
   text scope
   timestamp with time zone created
   timestamp with time zone updated
   bigint application_id
   bigint user_id
   bigint id
}
class oauth2_provider_refreshtoken {
   varchar(255) token
   bigint access_token_id
   bigint application_id
   bigint user_id
   timestamp with time zone created
   timestamp with time zone updated
   timestamp with time zone revoked
   bigint id
}
class tournesol_comparison {
   double precision duration_ms
   timestamp with time zone datetime_lastedit
   timestamp with time zone datetime_add
   varchar(50) entity_1_2_ids_sorted
   bigint user_id
   bigint entity_1_id
   bigint entity_2_id
   bigint poll_id
   bigint id
}
class tournesol_comparisoncriteriascore {
   text criteria
   double precision score
   double precision weight
   bigint comparison_id
   bigint id
}
class tournesol_contributorrating {
   boolean is_public
   bigint user_id
   bigint entity_id
   bigint poll_id
   bigint id
}
class tournesol_contributorratingcriteriascore {
   text criteria
   double precision score
   double precision uncertainty
   bigint contributor_rating_id
   bigint id
}
class tournesol_contributorscaling {
   text criteria
   double precision scale
   double precision scale_uncertainty
   double precision translation
   double precision translation_uncertainty
   bigint poll_id
   bigint user_id
   bigint id
}
class tournesol_criteria {
   varchar(50) name
   bigint id
}
class tournesol_criterialocale {
   varchar(10) language
   varchar(255) label
   bigint criteria_id
   bigint id
}
class tournesol_criteriarank {
   integer rank
   boolean optional
   bigint criteria_id
   bigint poll_id
   bigint id
}
class tournesol_entity {
   timestamp with time zone metadata_timestamp
   timestamp with time zone add_time
   timestamp with time zone last_metadata_request_at
   integer rating_n_ratings
   integer rating_n_contributors
   jsonb metadata
   varchar(32) type
   varchar(144) uid
   double precision tournesol_score
   bigint id
}
class tournesol_entitycriteriascore {
   text criteria
   double precision score
   double precision uncertainty
   double precision quantile
   bigint entity_id
   bigint poll_id
   double precision deviation
   varchar(30) score_mode
   bigint id
}
class tournesol_poll {
   varchar(50) name
   varchar(32) entity_type
   varchar(32) algorithm
   boolean active
   bigint id
}
class tournesol_videoratelater {
   timestamp with time zone datetime_add
   bigint user_id
   bigint video_id
   bigint id
}
class twitterbot_tweetinfo {
   varchar(22) tweet_id
   timestamp with time zone datetime_tweet
   varchar(200) bot_name
   bigint video_id
   bigint id
}

auth_group_permissions  -->  auth_group : group_id:id
auth_group_permissions  -->  auth_permission : permission_id:id
auth_permission  -->  django_content_type : content_type_id:id
core_degree  -->  core_user : user_id:id
core_expertise  -->  core_user : user_id:id
core_expertisekeyword  -->  core_user : user_id:id
core_user_groups  -->  auth_group : group_id:id
core_user_groups  -->  core_user : user_id:id
core_user_user_permissions  -->  auth_permission : permission_id:id
core_user_user_permissions  -->  core_user : user_id:id
core_verifiableemail  -->  core_emaildomain : domain_fk_id:id
core_verifiableemail  -->  core_user : user_id:id
django_admin_log  -->  core_user : user_id:id
django_admin_log  -->  django_content_type : content_type_id:id
oauth2_provider_accesstoken  -->  core_user : user_id:id
oauth2_provider_accesstoken  -->  oauth2_provider_application : application_id:id
oauth2_provider_accesstoken  -->  oauth2_provider_idtoken : id_token_id:id
oauth2_provider_accesstoken  -->  oauth2_provider_refreshtoken : source_refresh_token_id:id
oauth2_provider_application  -->  core_user : user_id:id
oauth2_provider_grant  -->  core_user : user_id:id
oauth2_provider_grant  -->  oauth2_provider_application : application_id:id
oauth2_provider_idtoken  -->  core_user : user_id:id
oauth2_provider_idtoken  -->  oauth2_provider_application : application_id:id
oauth2_provider_refreshtoken  -->  core_user : user_id:id
oauth2_provider_refreshtoken  -->  oauth2_provider_accesstoken : access_token_id:id
oauth2_provider_refreshtoken  -->  oauth2_provider_application : application_id:id
tournesol_comparison  -->  core_user : user_id:id
tournesol_comparison  -->  tournesol_entity : entity_2_id:id
tournesol_comparison  -->  tournesol_entity : entity_1_id:id
tournesol_comparison  -->  tournesol_poll : poll_id:id
tournesol_comparisoncriteriascore  -->  tournesol_comparison : comparison_id:id
tournesol_contributorrating  -->  core_user : user_id:id
tournesol_contributorrating  -->  tournesol_entity : entity_id:id
tournesol_contributorrating  -->  tournesol_poll : poll_id:id
tournesol_contributorratingcriteriascore  -->  tournesol_contributorrating : contributor_rating_id:id
tournesol_contributorscaling  -->  core_user : user_id:id
tournesol_contributorscaling  -->  tournesol_poll : poll_id:id
tournesol_criterialocale  -->  tournesol_criteria : criteria_id:id
tournesol_criteriarank  -->  tournesol_criteria : criteria_id:id
tournesol_criteriarank  -->  tournesol_poll : poll_id:id
tournesol_entitycriteriascore  -->  tournesol_entity : entity_id:id
tournesol_entitycriteriascore  -->  tournesol_poll : poll_id:id
tournesol_videoratelater  -->  core_user : user_id:id
tournesol_videoratelater  -->  tournesol_entity : video_id:id
twitterbot_tweetinfo  -->  tournesol_entity : video_id:id