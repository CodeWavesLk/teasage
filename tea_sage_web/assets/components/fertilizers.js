import React from 'react';
import { useLocation } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';

const useStyles = makeStyles((theme) => ({
    container: {
        padding: theme.spacing(4),
        textAlign: 'center',
        backgroundColor: '#f5f5f5',
        borderRadius: '8px',
        marginTop: '20px',
    },
    title: {
        marginBottom: theme.spacing(2),
        color: theme.palette.primary.main,
    },
    code: {
        fontWeight: 'bold',
        fontSize: '24px',
        color: '#333',
    },
    backButton: {
        marginTop: theme.spacing(4),
    },
}));

const Fertilizers = () => {
    const classes = useStyles();
    const location = useLocation();
    const { code } = location.state || {}; // Get the class code passed from the previous page

    return (
        <Container className={classes.container}>
            <Typography variant="h4" className={classes.title}>
                Results
            </Typography>
            <Typography variant="h6">
                Here are the details of the predicted class:
            </Typography>
            {code ? (
                <Typography variant="h5" className={classes.code}>
                    Class Code: {code}
                </Typography>
            ) : (
                <Typography variant="h5" className={classes.code}>
                    No class code available.
                </Typography>
            )}
            {/* You can add more information or a summary here */}
            <Button
                variant="contained"
                color="primary"
                className={classes.backButton}
                onClick={() => window.history.back()} // Go back to the previous page
            >
                Go Back
            </Button>
        </Container>
    );
};

export default Fertilizers;
