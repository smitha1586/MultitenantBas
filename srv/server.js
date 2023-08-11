const cds = require('@sap/cds');
const debug = require('debug')('srv:server');



cds.on('served', () => {

    const { 'cds.xt.SaasProvisioningService': provisioning } = cds.services;
    provisioning.prepend(() => {

        provisioning.on('UPDATE', 'tenant', async (req, next) => {
            let tenantURL = process.env.APP_PROTOCOL + ':\/\/' + req.data.subscribedSubdomain + '-' + process.env.APP_URI;
            console.log('Subscribe:', req.data.subscribedSubdomain, req.data.subscribedTenantId, tenantURL);
            await next();
            return tenantURL;
        });

        provisioning.on('DELETE', 'tenant', async (req, next) => {
            console.log('Unsubscribe:', req.data.subscribedSubdomain, req.data.subscribedTenantId);
            await next();
            return req.data.subscribedTenantId;
        });

    });

    /* upgrade tenant - override
    const { 'cds.xt.DeploymentService': deployment } = cds.services;
    deployment.prepend(() => {
        deployment.on('upgrade', async (req) => {
            console.log('UpgradeTenant:', req.data);
            return '';
        });
    });
    */

});

module.exports = cds.server;