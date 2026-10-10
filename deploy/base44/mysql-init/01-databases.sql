-- Base44 sandbox: databases used by the services.
-- The repository ships no schema, so the sandbox only creates the databases
-- themselves. Tables are created by the application/seed data as needed.
CREATE DATABASE IF NOT EXISTS `jzo2o-foundations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-customer-all` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-trade` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-market` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-orders-0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-orders-1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-orders-2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `jzo2o-orders-history` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
