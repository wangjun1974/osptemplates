CUSTOM=/home/stack/ovs-dpdk

openstack overcloud deploy \
 --templates --update-plan-only \
 -r /home/stack/ovs-dpdk/templates/roles_data.yaml \
 -n /home/stack/ovs-dpdk/templates/network_data.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-dashboard.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-rgw.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/cinder-backup.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs-dpdk.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
 -e $CUSTOM/containers-prepare-parameter.yaml \
 -e $CUSTOM/templates/ceph_config.yaml \
 -e $CUSTOM/templates/node_info.yaml \
 -e $CUSTOM/templates/network-environment.yaml \
 -e $CUSTOM/templates/overcloud-image.yaml \
 -e $CUSTOM/templates/root_password.yaml \
 -e $CUSTOM/templates/externalvip.yaml \
 -e $CUSTOM/templates/fencing.yaml \
 --ntp-server 192.168.24.1 --libvirt-type kvm  --timeout 240 \
 --log-file overcloud-deployment.log
