[Unit]
Description=Platform testing cdh blackbox

[Service]
Type=oneshot
ExecStart={{ platform_testing_directory }}/{{platform_testing_package}}/venv/bin/python \
        {{ platform_testing_directory }}/{{platform_testing_package}}/monitor.py \
        --plugin cdh_blackbox --postjson http://{{ console_hoststring }}/metrics \
        --extra "--cmhost {{ cm_hoststring }} \
            --cmport {{ cm_port }} \
            --cmuser {{ cm_username }} \
            --cmpassword {{ cm_password }} \
            --hadoopdistro {{ hadoop_distro }} \
            --hivehost {{ hive_node }} \
            --hiveport {{ hive_http_port }} \
            --hivejar {{ jdbc_driver_jar }}:{{ hive_service_jar }}:{{ http_core_jar }}:{{ libthrift_jar }}:{{ httpclient_jar }}"
