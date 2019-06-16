declare global {
    interface PluginRegistry {
        LSFirebaseMessaging: LSFirebaseMessagingPlugin;
    }
}
export interface LSFirebaseMessagingPlugin {
    getLatestToken(): Promise<any>;
}
