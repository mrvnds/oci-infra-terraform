resource "oci_apigateway_deployment" "test_deployment" {
    #Required
    compartment_id = var.compartment_id
    gateway_id = oci_apigateway_gateway.test_gateway.id
    path_prefix = var.deployment_path_prefix
    specification {

        #Optional
        logging_policies {

            #Optional
            access_log {

                #Optional
                is_enabled = var.deployment_specification_logging_policies_access_log_is_enabled
            }
            execution_log {

                #Optional
                is_enabled = var.deployment_specification_logging_policies_execution_log_is_enabled
                log_level = var.deployment_specification_logging_policies_execution_log_log_level
            }
        }
        request_policies {

            #Optional
            authentication {
                #Required
                type = var.deployment_specification_request_policies_authentication_type

                #Optional
                audiences = var.deployment_specification_request_policies_authentication_audiences
                cache_key = var.deployment_specification_request_policies_authentication_cache_key
                function_id = oci_functions_function.test_function.id
                is_anonymous_access_allowed = var.deployment_specification_request_policies_authentication_is_anonymous_access_allowed
                issuers = var.deployment_specification_request_policies_authentication_issuers
                max_clock_skew_in_seconds = var.deployment_specification_request_policies_authentication_max_clock_skew_in_seconds
                parameters = var.deployment_specification_request_policies_authentication_parameters
                public_keys {
                    #Required
                    type = var.deployment_specification_request_policies_authentication_public_keys_type

                    #Optional
                    is_ssl_verify_disabled = var.deployment_specification_request_policies_authentication_public_keys_is_ssl_verify_disabled
                    keys {
                        #Required
                        format = var.deployment_specification_request_policies_authentication_public_keys_keys_format

                        #Optional
                        alg = var.deployment_specification_request_policies_authentication_public_keys_keys_alg
                        e = var.deployment_specification_request_policies_authentication_public_keys_keys_e
                        key = var.deployment_specification_request_policies_authentication_public_keys_keys_key
                        key_ops = var.deployment_specification_request_policies_authentication_public_keys_keys_key_ops
                        kid = var.deployment_specification_request_policies_authentication_public_keys_keys_kid
                        kty = var.deployment_specification_request_policies_authentication_public_keys_keys_kty
                        n = var.deployment_specification_request_policies_authentication_public_keys_keys_n
                        use = var.deployment_specification_request_policies_authentication_public_keys_keys_use
                    }
                    max_cache_duration_in_hours = var.deployment_specification_request_policies_authentication_public_keys_max_cache_duration_in_hours
                    uri = var.deployment_specification_request_policies_authentication_public_keys_uri
                }
                token_auth_scheme = var.deployment_specification_request_policies_authentication_token_auth_scheme
                token_header = var.deployment_specification_request_policies_authentication_token_header
                token_query_param = var.deployment_specification_request_policies_authentication_token_query_param
                validation_failure_policy {
                    #Required
                    type = var.deployment_specification_request_policies_authentication_validation_failure_policy_type

                    #Optional
                    client_details {
                        #Required
                        type = var.deployment_specification_request_policies_authentication_validation_failure_policy_client_details_type

                        #Optional
                        client_id = oci_apigateway_client.test_client.id
                        client_secret_id = oci_vault_secret.test_secret.id
                        client_secret_version_number = var.deployment_specification_request_policies_authentication_validation_failure_policy_client_details_client_secret_version_number
                    }
                    fallback_redirect_path = var.deployment_specification_request_policies_authentication_validation_failure_policy_fallback_redirect_path
                    logout_path = var.deployment_specification_request_policies_authentication_validation_failure_policy_logout_path
                    max_expiry_duration_in_hours = var.deployment_specification_request_policies_authentication_validation_failure_policy_max_expiry_duration_in_hours
                    response_code = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_code
                    response_header_transformations {

                        #Optional
                        filter_headers {

                            #Optional
                            items {

                                #Optional
                                name = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_filter_headers_items_name
                            }
                            type = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_filter_headers_type
                        }
                        rename_headers {

                            #Optional
                            items {

                                #Optional
                                from = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_rename_headers_items_from
                                to = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_rename_headers_items_to
                            }
                        }
                        set_headers {

                            #Optional
                            items {

                                #Optional
                                if_exists = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_if_exists
                                name = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_name
                                values = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_header_transformations_set_headers_items_values
                            }
                        }
                    }
                    response_message = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_message
                    response_type = var.deployment_specification_request_policies_authentication_validation_failure_policy_response_type
                    scopes = var.deployment_specification_request_policies_authentication_validation_failure_policy_scopes
                    source_uri_details {
                        #Required
                        type = var.deployment_specification_request_policies_authentication_validation_failure_policy_source_uri_details_type

                        #Optional
                        uri = var.deployment_specification_request_policies_authentication_validation_failure_policy_source_uri_details_uri
                    }
                    use_cookies_for_intermediate_steps = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_cookies_for_intermediate_steps
                    use_cookies_for_session = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_cookies_for_session
                    use_pkce = var.deployment_specification_request_policies_authentication_validation_failure_policy_use_pkce
                }
                validation_policy {
                    #Required
                    type = var.deployment_specification_request_policies_authentication_validation_policy_type

                    #Optional
                    additional_validation_policy {

                        #Optional
                        audiences = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_audiences
                        issuers = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_issuers
                        verify_claims {

                            #Optional
                            is_required = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_is_required
                            key = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_key
                            values = var.deployment_specification_request_policies_authentication_validation_policy_additional_validation_policy_verify_claims_values
                        }
                    }
                    client_details {
                        #Required
                        type = var.deployment_specification_request_policies_authentication_validation_policy_client_details_type

                        #Optional
                        client_id = oci_apigateway_client.test_client.id
                        client_secret_id = oci_vault_secret.test_secret.id
                        client_secret_version_number = var.deployment_specification_request_policies_authentication_validation_policy_client_details_client_secret_version_number
                    }
                    is_ssl_verify_disabled = var.deployment_specification_request_policies_authentication_validation_policy_is_ssl_verify_disabled
                    keys {
                        #Required
                        format = var.deployment_specification_request_policies_authentication_validation_policy_keys_format

                        #Optional
                        alg = var.deployment_specification_request_policies_authentication_validation_policy_keys_alg
                        e = var.deployment_specification_request_policies_authentication_validation_policy_keys_e
                        key = var.deployment_specification_request_policies_authentication_validation_policy_keys_key
                        key_ops = var.deployment_specification_request_policies_authentication_validation_policy_keys_key_ops
                        kid = var.deployment_specification_request_policies_authentication_validation_policy_keys_kid
                        kty = var.deployment_specification_request_policies_authentication_validation_policy_keys_kty
                        n = var.deployment_specification_request_policies_authentication_validation_policy_keys_n
                        use = var.deployment_specification_request_policies_authentication_validation_policy_keys_use
                    }
                    max_cache_duration_in_hours = var.deployment_specification_request_policies_authentication_validation_policy_max_cache_duration_in_hours
                    source_uri_details {
                        #Required
                        type = var.deployment_specification_request_policies_authentication_validation_policy_source_uri_details_type

                        #Optional
                        uri = var.deployment_specification_request_policies_authentication_validation_policy_source_uri_details_uri
                    }
                    uri = var.deployment_specification_request_policies_authentication_validation_policy_uri
                }
                verify_claims {

                    #Optional
                    is_required = var.deployment_specification_request_policies_authentication_verify_claims_is_required
                    key = var.deployment_specification_request_policies_authentication_verify_claims_key
                    values = var.deployment_specification_request_policies_authentication_verify_claims_values
                }
            }
            cors {
                #Required
                allowed_origins = var.deployment_specification_request_policies_cors_allowed_origins

                #Optional
                allowed_headers = var.deployment_specification_request_policies_cors_allowed_headers
                allowed_methods = var.deployment_specification_request_policies_cors_allowed_methods
                exposed_headers = var.deployment_specification_request_policies_cors_exposed_headers
                is_allow_credentials_enabled = var.deployment_specification_request_policies_cors_is_allow_credentials_enabled
                max_age_in_seconds = var.deployment_specification_request_policies_cors_max_age_in_seconds
            }
            dynamic_authentication {
                #Required
                authentication_servers {
                    #Required
                    authentication_server_detail {
                        #Required
                        type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_type

                        #Optional
                        audiences = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_audiences
                        function_id = oci_functions_function.test_function.id
                        is_anonymous_access_allowed = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_is_anonymous_access_allowed
                        issuers = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_issuers
                        max_clock_skew_in_seconds = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_max_clock_skew_in_seconds
                        public_keys {
                            #Required
                            type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_type

                            #Optional
                            is_ssl_verify_disabled = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_is_ssl_verify_disabled
                            keys {
                                #Required
                                format = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_format

                                #Optional
                                alg = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_alg
                                e = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_e
                                key = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_key
                                key_ops = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_key_ops
                                kid = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_kid
                                kty = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_kty
                                n = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_n
                                use = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_keys_use
                            }
                            max_cache_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_max_cache_duration_in_hours
                            uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_public_keys_uri
                        }
                        token_auth_scheme = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_auth_scheme
                        token_header = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_header
                        token_query_param = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_token_query_param
                        validation_failure_policy {
                            #Required
                            type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_type

                            #Optional
                            client_details {
                                #Required
                                type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_client_details_type

                                #Optional
                                client_id = oci_apigateway_client.test_client.id
                                client_secret_id = oci_vault_secret.test_secret.id
                                client_secret_version_number = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_client_details_client_secret_version_number
                            }
                            fallback_redirect_path = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_fallback_redirect_path
                            logout_path = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_logout_path
                            max_expiry_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_max_expiry_duration_in_hours
                            response_code = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_code
                            response_header_transformations {

                                #Optional
                                filter_headers {

                                    #Optional
                                    items {

                                        #Optional
                                        name = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_filter_headers_items_name
                                    }
                                    type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_filter_headers_type
                                }
                                rename_headers {

                                    #Optional
                                    items {

                                        #Optional
                                        from = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_rename_headers_items_from
                                        to = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_rename_headers_items_to
                                    }
                                }
                                set_headers {

                                    #Optional
                                    items {

                                        #Optional
                                        if_exists = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_if_exists
                                        name = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_name
                                        values = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_header_transformations_set_headers_items_values
                                    }
                                }
                            }
                            response_message = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_message
                            response_type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_response_type
                            scopes = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_scopes
                            source_uri_details {
                                #Required
                                type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_source_uri_details_type

                                #Optional
                                uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_source_uri_details_uri
                            }
                            use_cookies_for_intermediate_steps = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_cookies_for_intermediate_steps
                            use_cookies_for_session = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_cookies_for_session
                            use_pkce = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_failure_policy_use_pkce
                        }
                        validation_policy {
                            #Required
                            type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_type

                            #Optional
                            additional_validation_policy {

                                #Optional
                                audiences = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_audiences
                                issuers = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_issuers
                                verify_claims {

                                    #Optional
                                    is_required = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_is_required
                                    key = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_key
                                    values = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_additional_validation_policy_verify_claims_values
                                }
                            }
                            client_details {
                                #Required
                                type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_client_details_type

                                #Optional
                                client_id = oci_apigateway_client.test_client.id
                                client_secret_id = oci_vault_secret.test_secret.id
                                client_secret_version_number = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_client_details_client_secret_version_number
                            }
                            is_ssl_verify_disabled = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_is_ssl_verify_disabled
                            keys {
                                #Required
                                format = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_format

                                #Optional
                                alg = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_alg
                                e = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_e
                                key = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_key
                                key_ops = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_key_ops
                                kid = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_kid
                                kty = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_kty
                                n = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_n
                                use = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_keys_use
                            }
                            max_cache_duration_in_hours = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_max_cache_duration_in_hours
                            source_uri_details {
                                #Required
                                type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_source_uri_details_type

                                #Optional
                                uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_source_uri_details_uri
                            }
                            uri = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_validation_policy_uri
                        }
                        verify_claims {

                            #Optional
                            is_required = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_is_required
                            key = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_key
                            values = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_authentication_server_detail_verify_claims_values
                        }
                    }
                    key {
                        #Required
                        name = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_name

                        #Optional
                        expression = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_expression
                        is_default = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_is_default
                        type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_type
                        values = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_values
                    }
                }
                selection_source {
                    #Required
                    selector = var.deployment_specification_request_policies_dynamic_authentication_selection_source_selector
                    type = var.deployment_specification_request_policies_dynamic_authentication_selection_source_type
                }
            }
            mutual_tls {

                #Optional
                allowed_sans = var.deployment_specification_request_policies_mutual_tls_allowed_sans
                is_verified_certificate_required = var.deployment_specification_request_policies_mutual_tls_is_verified_certificate_required
            }
            rate_limiting {
                #Required
                rate_in_requests_per_second = var.deployment_specification_request_policies_rate_limiting_rate_in_requests_per_second
                rate_key = var.deployment_specification_request_policies_rate_limiting_rate_key
            }
            usage_plans {
                #Required
                token_locations = var.deployment_specification_request_policies_usage_plans_token_locations
            }
        }
        routes {
            #Required
            backend {
                #Required
                type = var.deployment_specification_routes_backend_type

                #Optional
                allowed_post_logout_uris = var.deployment_specification_routes_backend_allowed_post_logout_uris
                body = var.deployment_specification_routes_backend_body
                connect_timeout_in_seconds = var.deployment_specification_routes_backend_connect_timeout_in_seconds
                function_id = oci_functions_function.test_function.id
                headers {

                    #Optional
                    name = var.deployment_specification_routes_backend_headers_name
                    value = var.deployment_specification_routes_backend_headers_value
                }
                is_ssl_verify_disabled = var.deployment_specification_routes_backend_is_ssl_verify_disabled
                post_logout_state = var.deployment_specification_routes_backend_post_logout_state
                read_timeout_in_seconds = var.deployment_specification_routes_backend_read_timeout_in_seconds
                routing_backends {
                    backend {
                        #Required
                        type = var.deployment_specification_routes_backend_routing_backends_backend_type

                        #Optional
                        body = var.deployment_specification_routes_backend_routing_backends_backend_body
                        connect_timeout_in_seconds = var.deployment_specification_routes_backend_routing_backends_backend_connect_timeout_in_seconds
                        function_id = oci_functions_function.test_function.id
                        headers {

                            #Optional
                            name = var.deployment_specification_routes_backend_routing_backends_backend_headers_name
                            value = var.deployment_specification_routes_backend_routing_backends_backend_headers_value
                        }
                        is_ssl_verify_disabled = var.deployment_specification_routes_backend_routing_backends_backend_is_ssl_verify_disabled
                        read_timeout_in_seconds = var.deployment_specification_routes_backend_routing_backends_backend_read_timeout_in_seconds
                        send_timeout_in_seconds = var.deployment_specification_routes_backend_routing_backends_backend_send_timeout_in_seconds
                        status = var.deployment_specification_routes_backend_routing_backends_backend_status
                        url = var.deployment_specification_routes_backend_routing_backends_backend_url
                    }
                    key {
                        #Required
                        name = var.deployment_specification_routes_backend_routing_backends_key_name
                        type = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_type

                        #Optional
                        expression = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_expression
                        is_default = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_is_default
                        values = var.deployment_specification_request_policies_dynamic_authentication_authentication_servers_key_values
                    }
                }
                selection_source {
                    #Required
                    selector = var.deployment_specification_routes_backend_selection_source_selector
                    type = var.deployment_specification_routes_backend_selection_source_type
                }
                send_timeout_in_seconds = var.deployment_specification_routes_backend_send_timeout_in_seconds
                status = var.deployment_specification_routes_backend_status
                url = var.deployment_specification_routes_backend_url
            }
            path = var.deployment_specification_routes_path

            #Optional
            logging_policies {

                #Optional
                access_log {

                    #Optional
                    is_enabled = var.deployment_specification_routes_logging_policies_access_log_is_enabled
                }
                execution_log {

                    #Optional
                    is_enabled = var.deployment_specification_routes_logging_policies_execution_log_is_enabled
                    log_level = var.deployment_specification_routes_logging_policies_execution_log_log_level
                }
            }
            methods = var.deployment_specification_routes_methods
            request_policies {

                #Optional
                authorization {

                    #Optional
                    allowed_scope = var.deployment_specification_routes_request_policies_authorization_allowed_scope
                    type = var.deployment_specification_routes_request_policies_authorization_type
                }
                body_validation {

                    #Optional
                    content {
                        #Required
                        media_type = var.deployment_specification_routes_request_policies_body_validation_content_media_type
                        validation_type = var.deployment_specification_routes_request_policies_body_validation_content_validation_type
                    }

                    required = var.deployment_specification_routes_request_policies_body_validation_required
                    validation_mode = var.deployment_specification_routes_request_policies_body_validation_validation_mode
                }
                cors {
                    #Required
                    allowed_origins = var.deployment_specification_routes_request_policies_cors_allowed_origins

                    #Optional
                    allowed_headers = var.deployment_specification_routes_request_policies_cors_allowed_headers
                    allowed_methods = var.deployment_specification_routes_request_policies_cors_allowed_methods
                    exposed_headers = var.deployment_specification_routes_request_policies_cors_exposed_headers
                    is_allow_credentials_enabled = var.deployment_specification_routes_request_policies_cors_is_allow_credentials_enabled
                    max_age_in_seconds = var.deployment_specification_routes_request_policies_cors_max_age_in_seconds
                }
                header_transformations {

                    #Optional
                    filter_headers {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_request_policies_header_transformations_filter_headers_items_name
                        }
                        type = var.deployment_specification_routes_request_policies_header_transformations_filter_headers_type
                    }
                    rename_headers {
                        #Required
                        items {
                            #Required
                            from = var.deployment_specification_routes_request_policies_header_transformations_rename_headers_items_from
                            to = var.deployment_specification_routes_request_policies_header_transformations_rename_headers_items_to
                        }
                    }
                    set_headers {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_name
                            values = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_values

                            #Optional
                            if_exists = var.deployment_specification_routes_request_policies_header_transformations_set_headers_items_if_exists
                        }
                    }
                }
                header_validations {

                    #Optional
                    headers {
                        #Required
                        name = var.deployment_specification_routes_request_policies_header_validations_headers_name

                        #Optional
                        required = var.deployment_specification_routes_request_policies_header_validations_headers_required
                    }
                    validation_mode = var.deployment_specification_routes_request_policies_header_validations_validation_mode
                }
                query_parameter_transformations {

                    #Optional
                    filter_query_parameters {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_request_policies_query_parameter_transformations_filter_query_parameters_items_name
                        }
                        type = var.deployment_specification_routes_request_policies_query_parameter_transformations_filter_query_parameters_type
                    }
                    rename_query_parameters {
                        #Required
                        items {
                            #Required
                            from = var.deployment_specification_routes_request_policies_query_parameter_transformations_rename_query_parameters_items_from
                            to = var.deployment_specification_routes_request_policies_query_parameter_transformations_rename_query_parameters_items_to
                        }
                    }
                    set_query_parameters {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_name
                            values = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_values

                            #Optional
                            if_exists = var.deployment_specification_routes_request_policies_query_parameter_transformations_set_query_parameters_items_if_exists
                        }
                    }
                }
                query_parameter_validations {

                    #Optional
                    parameters {
                        #Required
                        name = var.deployment_specification_routes_request_policies_query_parameter_validations_parameters_name

                        #Optional
                        required = var.deployment_specification_routes_request_policies_query_parameter_validations_parameters_required
                    }
                    validation_mode = var.deployment_specification_routes_request_policies_query_parameter_validations_validation_mode
                }
                response_cache_lookup {
                    #Required
                    type = var.deployment_specification_routes_request_policies_response_cache_lookup_type

                    #Optional
                    cache_key_additions = var.deployment_specification_routes_request_policies_response_cache_lookup_cache_key_additions
                    is_enabled = var.deployment_specification_routes_request_policies_response_cache_lookup_is_enabled
                    is_private_caching_enabled = var.deployment_specification_routes_request_policies_response_cache_lookup_is_private_caching_enabled
                }
            }
            response_policies {

                #Optional
                header_transformations {

                    #Optional
                    filter_headers {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_response_policies_header_transformations_filter_headers_items_name
                        }
                        type = var.deployment_specification_routes_response_policies_header_transformations_filter_headers_type
                    }
                    rename_headers {
                        #Required
                        items {
                            #Required
                            from = var.deployment_specification_routes_response_policies_header_transformations_rename_headers_items_from
                            to = var.deployment_specification_routes_response_policies_header_transformations_rename_headers_items_to
                        }
                    }
                    set_headers {
                        #Required
                        items {
                            #Required
                            name = var.deployment_specification_routes_response_policies_header_transformations_set_headers_items_name
                            values = var.deployment_specification_routes_response_policies_header_transformations_set_headers_items_values

                            #Optional
                            if_exists = var.deployment_specification_routes_response_policies_header_transformations_set_headers_items_if_exists
                        }
                    }
                }
                response_cache_store {
                    #Required
                    time_to_live_in_seconds = var.deployment_specification_routes_response_policies_response_cache_store_time_to_live_in_seconds
                    type = var.deployment_specification_routes_response_policies_response_cache_store_type
                }
            }
        }
    }

    #Optional
    defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.deployment_display_name
    freeform_tags = {"Department"= "Finance"}
}