--TABLAS

CREATE TABLE Notifications (
    notificationID NUMBER PRIMARY KEY,
    userID NUMBER NOT NULL,
    notificationType VARCHAR2(50) NOT NULL,
    content VARCHAR2(4000),
    fechaNotificacion DATE NOT NULL,
    FOREIGN KEY (userID) REFERENCES usuarios(userId)
);

CREATE TABLE usuarios (
    nombre VARCHAR2(100) NOT NULL,
    fechaDeRegistro DATE NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    userId NUMBER PRIMARY KEY
);

CREATE TABLE bookMarks (
    bookMarkId NUMBER PRIMARY KEY,
    userId NUMBER NOT NULL,
    tweetId NUMBER NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuarios(userId),
    FOREIGN KEY (tweetId) REFERENCES tweets(tweetID)
);

CREATE TABLE tweets (
    contenido VARCHAR2(280) NOT NULL,
    tweetID NUMBER PRIMARY KEY,
    fechaDePublicacion DATE NOT NULL
);

CREATE TABLE message (
    contenidoMensaje VARCHAR2(4000) NOT NULL,
    messageID NUMBER PRIMARY KEY,
    senderUserID NUMBER NOT NULL,
    receiverUserID NUMBER NOT NULL,
    fechaEnvio DATE NOT NULL,
    FOREIGN KEY (senderUserID) REFERENCES usuarios(userId),
    FOREIGN KEY (receiverUserID) REFERENCES usuarios(userId)
);

CREATE TABLE likes (
    likeID NUMBER PRIMARY KEY,
    tweetID NUMBER NOT NULL,
    seguidorID NUMBER NOT NULL,
    fechaDeLike DATE NOT NULL,
    FOREIGN KEY (tweetID) REFERENCES tweets(tweetID),
    FOREIGN KEY (seguidorID) REFERENCES seguidores(seguidorID)
);

CREATE TABLE seguidores (
    seguidorID NUMBER PRIMARY KEY,
    userID NUMBER NOT NULL,
    fechaDeSeguimiento DATE NOT NULL,
    FOREIGN KEY (userID) REFERENCES usuarios(userId)
);

CREATE TABLE trends (
    trendID NUMBER PRIMARY KEY,
    nombreDelTrend VARCHAR2(100) NOT NULL
);

CREATE TABLE Auditoria (
    id NUMBER PRIMARY KEY,
    tabla_nombre VARCHAR2(50),
    operacion VARCHAR2(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR2(100),
    old_values CLOB,
    new_values CLOB
);

CREATE TABLE twitter_audit (
    auditID NUMBER PRIMARY KEY,
    action_type VARCHAR2(50),
    table_name VARCHAR2(50),
    record_id NUMBER,
    old_value VARCHAR2(4000),
    new_value VARCHAR2(4000),
    change_date TIMESTAMP DEFAULT SYSTIMESTAMP,
    user_id NUMBER
);

/*INSERCIONES*/

    -- Insertar en la tabla usuarios
    INSERT INTO usuarios (nombre, fechaDeRegistro, email, userId)
    VALUES ('Ana García', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'ana.garcia@example.com', 1);
    
    INSERT INTO usuarios (nombre, fechaDeRegistro, email, userId)
    VALUES ('Carlos Pérez', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 'carlos.perez@example.com', 2);
    
    INSERT INTO usuarios (nombre, fechaDeRegistro, email, userId)
    VALUES ('María López', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'maria.lopez@example.com', 3);

    -- Insertar en la tabla tweets
    INSERT INTO tweets (contenido, tweetID, fechaDePublicacion)
    VALUES ('Este es mi primer tweet!', 1, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
    
    INSERT INTO tweets (contenido, tweetID, fechaDePublicacion)
    VALUES ('Me encanta programar en SQL.', 2, TO_DATE('2023-07-02', 'YYYY-MM-DD'));
    
    INSERT INTO tweets (contenido, tweetID, fechaDePublicacion)
    VALUES ('Hoy es un buen día para aprender algo nuevo.', 3, TO_DATE('2023-07-03', 'YYYY-MM-DD'));

    -- Insertar en la tabla bookMarks
    INSERT INTO bookMarks (bookMarkId, userId, tweetId)
    VALUES (1, 1, 1);
    
    INSERT INTO bookMarks (bookMarkId, userId, tweetId)
    VALUES (2, 2, 2);
    
    INSERT INTO bookMarks (bookMarkId, userId, tweetId)
    VALUES (3, 3, 3);

    -- Insertar en la tabla Notifications
    INSERT INTO Notifications (notificationID, userID, notificationType, content, fechaNotificacion)
    VALUES (1, 1, 'like', 'Carlos Pérez le gustó tu tweet.', TO_DATE('2023-07-01', 'YYYY-MM-DD'));
    
    INSERT INTO Notifications (notificationID, userID, notificationType, content, fechaNotificacion)
    VALUES (2, 2, 'follow', 'María López empezó a seguirte.', TO_DATE('2023-07-02', 'YYYY-MM-DD'));
    
    INSERT INTO Notifications (notificationID, userID, notificationType, content, fechaNotificacion)
    VALUES (3, 3, 'mention', 'Ana García te mencionó en un tweet.', TO_DATE('2023-07-03', 'YYYY-MM-DD'));

    -- Insertar en la tabla message
    INSERT INTO message (contenidoMensaje, messageID, senderUserID, receiverUserID, fechaEnvio)
    VALUES ('Hola, ¿cómo estás?', 1, 1, 2, TO_DATE('2023-07-04', 'YYYY-MM-DD'));
    
    INSERT INTO message (contenidoMensaje, messageID, senderUserID, receiverUserID, fechaEnvio)
    VALUES ('¡Nos vemos mañana!', 2, 2, 3, TO_DATE('2023-07-05', 'YYYY-MM-DD'));
    
    INSERT INTO message (contenidoMensaje, messageID, senderUserID, receiverUserID, fechaEnvio)
    VALUES ('¿Qué tal tu día?', 3, 3, 1, TO_DATE('2023-07-06', 'YYYY-MM-DD'));

    -- Insertar en la tabla likes
    INSERT INTO likes (likeID, tweetID, seguidorID, fechaDeLike)
    VALUES (1, 1, 1, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
    
    INSERT INTO likes (likeID, tweetID, seguidorID, fechaDeLike)
    VALUES (2, 2, 2, TO_DATE('2023-07-02', 'YYYY-MM-DD'));
    
    INSERT INTO likes (likeID, tweetID, seguidorID, fechaDeLike)
    VALUES (3, 3, 3, TO_DATE('2023-07-03', 'YYYY-MM-DD'));

    -- Insertar en la tabla seguidores
    INSERT INTO seguidores (seguidorID, userID, fechaDeSeguimiento)
    VALUES (1, 1, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
    
    INSERT INTO seguidores (seguidorID, userID, fechaDeSeguimiento)
    VALUES (2, 2, TO_DATE('2023-07-02', 'YYYY-MM-DD'));
    
    INSERT INTO seguidores (seguidorID, userID, fechaDeSeguimiento)
    VALUES (3, 3, TO_DATE('2023-07-03', 'YYYY-MM-DD'));

    -- Insertar en la tabla trends
    INSERT INTO trends (trendID, nombreDelTrend)
    VALUES (1, '#DesarrolloWeb');
    
    INSERT INTO trends (trendID, nombreDelTrend)
    VALUES (2, '#OracleSQL');
    
    INSERT INTO trends (trendID, nombreDelTrend)
    VALUES (3, '#Aprendizaje');


/*PROCEDIMIENTOS (Van dentro de los paquetes)*/


--CURSOR PARA LOS PROCEDIMIENTOS DE SEGUIDORES
DECLARE
    
    CURSOR c_seguidores IS
        SELECT COUNT(*) AS totalSeguidores
        FROM seguidores
        WHERE userID = p_userID;
    
    -- Variables para almacenar los resultados
    v_totalSeguidores NUMBER;
    
    -- Parámetro de entrada
    p_userID NUMBER := 1; -- Cambiar este valor basado en el UserID

BEGIN
    -- Abrir el cursor
    OPEN c_seguidores;
    FETCH c_seguidores INTO v_totalSeguidores;
    CLOSE c_seguidores;
 
    DBMS_OUTPUT.PUT_LINE('Total de seguidores: ' || v_totalSeguidores);
END;
/

/*SECUENCIAS*/
CREATE SEQUENCE twitter_audit_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 777
NOCACHE;

/*PROCEDIMIENTOS (Van dentro de los paquetes)*/

/*PAQUETES*/

--PAQUETE PARA EL MANEJO DE LOS TWEETS (CRUD TWEETS)
CREATE OR REPLACE PACKAGE TweetManagement AS
    PROCEDURE CrearTweet(
        p_contenido IN VARCHAR2,
        p_fechaDePublicacion IN DATE,
        p_tweetID IN NUMBER
    );
    
    PROCEDURE EditarTweet(
        p_tweetID IN NUMBER,
        p_nuevoContenido IN VARCHAR2,
        p_nuevaFechaDePublicacion IN DATE
    );
    
    PROCEDURE EliminarTweet(
        p_tweetID IN NUMBER
    );
END TweetManagement;
/


CREATE OR REPLACE PACKAGE BODY TweetManagement AS

    PROCEDURE CrearTweet(
        p_contenido IN VARCHAR2,
        p_fechaDePublicacion IN DATE,
        p_tweetID IN NUMBER
    ) AS
    BEGIN
        INSERT INTO tweets (contenido, tweetID, fechaDePublicacion)
        VALUES (p_contenido, p_tweetID, p_fechaDePublicacion);
        
        COMMIT;
    END CrearTweet;
    
    PROCEDURE EditarTweet(
        p_tweetID IN NUMBER,
        p_nuevoContenido IN VARCHAR2,
        p_nuevaFechaDePublicacion IN DATE
    ) AS
    BEGIN
        UPDATE tweets
        SET contenido = p_nuevoContenido,
            fechaDePublicacion = p_nuevaFechaDePublicacion
        WHERE tweetID = p_tweetID;
        
        COMMIT;
    END EditarTweet;
    
    PROCEDURE EliminarTweet(
        p_tweetID IN NUMBER
    ) AS
    BEGIN
        DELETE FROM tweets
        WHERE tweetID = p_tweetID;
        
        COMMIT;
    END EliminarTweet;

END TweetManagement;
/

----------------------------------------------------------------------------------------------------------------------------------------
--MANEJO DE SEGUIDORES
--Paquete para control de seguidores (CRUD FOLLOWERS)

CREATE OR REPLACE PACKAGE FollowerManagement AS
    PROCEDURE SeguirUsuario(
        p_seguidorID IN NUMBER,
        p_userID IN NUMBER,
        p_fechaDeSeguimiento IN DATE,
        p_numSeguidores OUT NUMBER
    );
    
    PROCEDURE DejarDeSeguirUsuario(
        p_seguidorID IN NUMBER,
        p_userID IN NUMBER,
        p_numSeguidores OUT NUMBER
    );
    
    CURSOR c_seguidores IS
        SELECT COUNT(*) AS totalSeguidores
        FROM seguidores
        WHERE userID = p_userID;
END FollowerManagement;
/


CREATE OR REPLACE PACKAGE BODY FollowerManagement AS

    PROCEDURE SeguirUsuario(
        p_seguidorID IN NUMBER,
        p_userID IN NUMBER,
        p_fechaDeSeguimiento IN DATE,
        p_numSeguidores OUT NUMBER
    ) AS
        r_seguidores seguidores%ROWTYPE;
        CURSOR c_seguidores IS
            SELECT COUNT(*) AS totalSeguidores
            FROM seguidores
            WHERE userID = p_userID;
    BEGIN
        INSERT INTO seguidores (seguidorID, userID, fechaDeSeguimiento)
        VALUES (p_seguidorID, p_userID, p_fechaDeSeguimiento);

        OPEN c_seguidores;
        FETCH c_seguidores INTO r_seguidores;
        CLOSE c_seguidores;

        p_numSeguidores := r_seguidores.totalSeguidores;

        COMMIT;
    END SeguirUsuario;
    
    PROCEDURE DejarDeSeguirUsuario(
        p_seguidorID IN NUMBER,
        p_userID IN NUMBER,
        p_numSeguidores OUT NUMBER
    ) AS
        r_seguidores seguidores%ROWTYPE;
        CURSOR c_seguidores IS
            SELECT COUNT(*) AS totalSeguidores
            FROM seguidores
            WHERE userID = p_userID;
    BEGIN
        DELETE FROM seguidores
        WHERE seguidorID = p_seguidorID AND userID = p_userID;

        OPEN c_seguidores;
        FETCH c_seguidores INTO r_seguidores;
        CLOSE c_seguidores;

        p_numSeguidores := r_seguidores.totalSeguidores;

        COMMIT;
    END DejarDeSeguirUsuario;

END FollowerManagement;
/

--PAQUETE MANEJO DE USUARIOS


CREATE OR REPLACE PACKAGE UserManagement AS
    PROCEDURE CrearUsuario(
        p_userID IN NUMBER,
        p_nombre IN VARCHAR2,
        p_email IN VARCHAR2
    );

    PROCEDURE EditarUsuario(
        p_userID IN NUMBER,
        p_nuevoNombre IN VARCHAR2,
        p_nuevoEmail IN VARCHAR2
    );
    
    PROCEDURE EliminarUsuario(
        p_userID IN NUMBER
    );
    
    FUNCTION ObtenerUsuario(
        p_userID IN NUMBER
    ) RETURN VARCHAR2;
END UserManagement;
/


CREATE OR REPLACE PACKAGE BODY UserManagement AS

    PROCEDURE CrearUsuario(
        p_userID IN NUMBER,
        p_nombre IN VARCHAR2,
        p_email IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO usuarios (userID, nombre, email)
        VALUES (p_userID, p_nombre, p_email);
        
        COMMIT;
    END CrearUsuario;

    PROCEDURE EditarUsuario(
        p_userID IN NUMBER,
        p_nuevoNombre IN VARCHAR2,
        p_nuevoEmail IN VARCHAR2
    ) AS
    BEGIN
        UPDATE usuarios
        SET nombre = p_nuevoNombre,
            email = p_nuevoEmail
        WHERE userID = p_userID;
        
        COMMIT;
    END EditarUsuario;

    PROCEDURE EliminarUsuario(
        p_userID IN NUMBER
    ) AS
    BEGIN
        DELETE FROM usuarios
        WHERE userID = p_userID;
        
        COMMIT;
    END EliminarUsuario;

    FUNCTION ObtenerUsuario(
        p_userID IN NUMBER
    ) RETURN VARCHAR2 IS
        v_nombre VARCHAR2(100);
    BEGIN
        SELECT nombre INTO v_nombre
        FROM usuarios
        WHERE userID = p_userID;

        RETURN v_nombre;
    END ObtenerUsuario;

END UserManagement;
/

--PAQUETE DE CONTROL DE MENSAJES
--CRUD DE MENSAJES
CREATE OR REPLACE PACKAGE DirectMessagesManagement AS
    PROCEDURE EnviarMensaje(
        p_deUserID IN NUMBER,
        p_paraUserID IN NUMBER,
        p_contenido IN VARCHAR2,
        p_fechaDeEnvio IN DATE
    );
    
    PROCEDURE EliminarMensaje(
        p_mensajeID IN NUMBER
    );
    
    FUNCTION ObtenerMensajes(
        p_paraUserID IN NUMBER
    ) RETURN SYS_REFCURSOR;
END DirectMessagesManagement;
/


CREATE OR REPLACE PACKAGE BODY DirectMessagesManagement AS

    PROCEDURE EnviarMensaje(
        p_deUserID IN NUMBER,
        p_paraUserID IN NUMBER,
        p_contenido IN VARCHAR2,
        p_fechaDeEnvio IN DATE
    ) AS
    BEGIN
        INSERT INTO mensajes_directos (deUserID, paraUserID, contenido, fechaDeEnvio)
        VALUES (p_deUserID, p_paraUserID, p_contenido, p_fechaDeEnvio);
        
        COMMIT;
    END EnviarMensaje;
    
    PROCEDURE EliminarMensaje(
        p_mensajeID IN NUMBER
    ) AS
    BEGIN
        DELETE FROM mensajes_directos
        WHERE mensajeID = p_mensajeID;
        
        COMMIT;
    END EliminarMensaje;

    FUNCTION ObtenerMensajes(
        p_paraUserID IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT *
            FROM mensajes_directos
            WHERE paraUserID = p_paraUserID
            ORDER BY fechaDeEnvio DESC;
        
        RETURN v_cursor;
    END ObtenerMensajes;

END DirectMessagesManagement;
/


--PAQUETE DE INTERACCIONES
--CRUD DE INTERACCIONES

CREATE OR REPLACE PACKAGE InteractionManagement AS
    PROCEDURE DarLike(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER
    );
    
    PROCEDURE Retweet(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER,
        p_fechaDeRetweet IN DATE
    );

    PROCEDURE EliminarInteraccion(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER
    );
END InteractionManagement;
/

CREATE OR REPLACE PACKAGE BODY InteractionManagement AS

    PROCEDURE DarLike(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER
    ) AS
    BEGIN
        INSERT INTO likes (tweetID, userID)
        VALUES (p_tweetID, p_userID);
        
        COMMIT;
    END DarLike;
    
    PROCEDURE Retweet(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER,
        p_fechaDeRetweet IN DATE
    ) AS
    BEGIN
        INSERT INTO retweets (tweetID, userID, fechaDeRetweet)
        VALUES (p_tweetID, p_userID, p_fechaDeRetweet);
        
        COMMIT;
    END Retweet;

    PROCEDURE EliminarInteraccion(
        p_tweetID IN NUMBER,
        p_userID IN NUMBER
    ) AS
    BEGIN
        DELETE FROM likes
        WHERE tweetID = p_tweetID AND userID = p_userID;

        DELETE FROM retweets
        WHERE tweetID = p_tweetID AND userID = p_userID;

        COMMIT;
    END EliminarInteraccion;

END InteractionManagement;
/

--PAQUETE DE AUDITORÍA
CREATE OR REPLACE PACKAGE AuditManagement AS
    PROCEDURE RegistrarAccion(
        p_userID IN NUMBER,
        p_accion IN VARCHAR2,
        p_fecha IN DATE
    );

    FUNCTION ObtenerHistorialUsuario(
        p_userID IN NUMBER
    ) RETURN SYS_REFCURSOR;
END AuditManagement;
/

CREATE OR REPLACE PACKAGE BODY AuditManagement AS

    PROCEDURE RegistrarAccion(
        p_userID IN NUMBER,
        p_accion IN VARCHAR2,
        p_fecha IN DATE
    ) AS
    BEGIN
        INSERT INTO auditoria (userID, accion, fecha)
        VALUES (p_userID, p_accion, p_fecha);

        COMMIT;
    END RegistrarAccion;

    FUNCTION ObtenerHistorialUsuario(
        p_userID IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT *
            FROM auditoria
            WHERE userID = p_userID
            ORDER BY fecha DESC;

        RETURN v_cursor;
    END ObtenerHistorialUsuario;

END AuditManagement;
/

/*FUNCIONES*/
CREATE OR REPLACE FUNCTION ObtenerNotificacionesPorUsuario(p_userID NUMBER) 
RETURN NUMBER IS
    v_totalNotificaciones NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_totalNotificaciones
    FROM Notifications
    WHERE userID = p_userID;
    RETURN v_totalNotificaciones;
END ObtenerNotificacionesPorUsuario;


/* TRIGGERS DE AUDITORÍA */

--Inserción de usuarios 
CREATE OR REPLACE TRIGGER trg_audit_usuarios_insert
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO twitter_audit (auditID, action_type, table_name, record_id, new_value, user_id)
    VALUES (
        twitter_audit_sequence.NEXTVAL,
        'INSERT',
        'usuarios',
        :NEW.userId,
        'nombre: ' || :NEW.nombre || ', fechaDeRegistro: ' || :NEW.fechaDeRegistro || ', email: ' || :NEW.email || ', userId: ' || :NEW.userId,
        USER
    );
END;

--Eliminación de usuarios
CREATE OR REPLACE TRIGGER trg_audit_usuarios_delete
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO twitter_audit (auditID, action_type, table_name, record_id, old_value, user_id)
    VALUES (
        twitter_audit_sequence.NEXTVAL,
        'DELETE',
        'usuarios',
        :OLD.userId,
        'nombre: ' || :OLD.nombre || ', fechaDeRegistro: ' || :OLD.fechaDeRegistro || ', email: ' || :OLD.email || ', userId: ' || :OLD.userId,
        USER
    );
END;

--Inserción de Tweets
CREATE OR REPLACE TRIGGER trg_audit_tweets_insert
AFTER INSERT ON tweets
FOR EACH ROW
BEGIN
    INSERT INTO twitter_audit (auditID, action_type, table_name, record_id, new_value, user_id)
    VALUES (
        twitter_audit_sequence.NEXTVAL,
        'INSERT',
        'tweets',
        :NEW.tweetID,
        'contenido: ' || :NEW.contenido || ', tweetID: ' || :NEW.tweetID || ', fechaDePublicacion: ' || :NEW.fechaDePublicacion,
        USER
    );
END;

--Eliminación de Tweets
CREATE OR REPLACE TRIGGER trg_audit_tweets_delete
AFTER DELETE ON tweets
FOR EACH ROW
BEGIN
    INSERT INTO twitter_audit (auditID, action_type, table_name, record_id, old_value, user_id)
    VALUES (
        twitter_audit_sequence.NEXTVAL,
        'DELETE',
        'tweets',
        :OLD.tweetID,
        'contenido: ' || :OLD.contenido || ', tweetID: ' || :OLD.tweetID || ', fechaDePublicacion: ' || :OLD.fechaDePublicacion,
        USER
    );
END;
